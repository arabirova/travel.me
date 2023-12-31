//
//  MapViewController.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import UIKit
import SnapKit
import GoogleMaps

class MapViewController: UIViewController {
    var points: [MapModel] = []
    var markers: [GMSMarker] = []
    private let coordinates: CLLocationCoordinate2D =
        .init(latitude: 53.529167, longitude: 28.045) // это графический центр Беларуси для приблежения карты
    
    private lazy var map: GMSMapView = {
        let map = GMSMapView()
        return map
    }()

    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeUI()
        makeConstraint()
        makeTitle()
        moveCamera(to: coordinates)
        readList()
        map.delegate = self

    }
    
    private func makeUI() {
        self.view.addSubview(map)

    }
    
    private func makeConstraint() {
        map.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func makeTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "#Карта"
        titleLabel.textColor = .systemGreen
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.sizeToFit()

        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    private func moveCamera(to: CLLocationCoordinate2D) {
        map.camera = GMSCameraPosition(target: to, zoom: 6)
    }
    
    private func readList() {
        Environment.ref.child("map").observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let mapDict = (snapshot.value as? [String: Any]) else { return }
            self?.parseData(mapDict)
        })
    }
    
    private func parseData(_ dict: [String: Any]) {
        points.removeAll()
        for (_, value) in dict {
            guard let answer = value as? [String: Any] else { continue }
            guard let new = try? MapModel(
                dict: answer
            ) else { return }
            self.points.append(new)
            getCoordinate(point: new)
        }
    }
    
    private func getCoordinate(point: MapModel) {
        for _ in points {
            guard let lat = Double(point.lat),
                  let long = Double(point.long)
            else { return }
            let coord = CLLocationCoordinate2D(latitude: lat, longitude: long)
            let name = point.name
            let imageURL = point.imageURL
            let description = point.description
            let coordinates = point.coordinates
            let openURL = point.openURL
            let dict = ["name": name, "imageURL": imageURL, "description": description, "coordinates": coordinates, "openURL": openURL]
            self.createMarker(coordinate: coord, dict: dict)
        }
    }
    
    private func createMarker(coordinate:CLLocationCoordinate2D, dict: [String: Any]) {
        let marker = GMSMarker(position: coordinate)
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fill
        let image = UIImageView()
        view.addArrangedSubview(image)
        image.image = UIImage(named: "mapPoint")
        image.contentMode = .scaleAspectFill
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(35)
        }
        
        view.snp.makeConstraints { make in
            make.height.width.equalTo(35)
        }
        
        marker.iconView = view
        marker.icon = UIImage(named: "mapPoint")
        marker.userData = dict
        marker.map = map
    }
}

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        guard let data = marker.userData as? [String: Any] else {
            return true
        }
        let name = data["name"] as? String ?? ""
        let imageURL = data["imageURL"] as? String ?? ""
        let detailDescription = data["description"] as? String ?? ""
        let coordinates = data["coordinates"] as? String ?? ""
        let openURL = data["openURL"] as? String ?? ""
        
        let createMarkerVC = MarkerViewController(name: name, detailDescription: detailDescription, imageURL: imageURL, coordinates: coordinates, openURL: openURL)
        createMarkerVC.modalPresentationStyle = .overFullScreen
        createMarkerVC.modalTransitionStyle = .crossDissolve
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            topController.present(createMarkerVC, animated: true)
        }
        return true
    }
}
