//
//  RouteDetailsViewController.swift
//  travel.me
//
//  Created by Сашка on 25.09.23.
//

import UIKit
import SnapKit
import GoogleMaps

class RouteDetailsViewController: UIViewController {
    
    private var route: RouteModel
    var markers: [GMSMarker] = []
    var coordinates: [CLLocationCoordinate2D] = []
    
    init(route: RouteModel) {
        self.route = route
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "travel")
        return image
    }()
    
    private lazy var imageShadow: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shadow")
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 13)
        label.numberOfLines = 100
        return label
    }()
    
    private lazy var map: GMSMapView = {
        let map = GMSMapView()
        return map
    }()
    
    private func makeUI() {
        self.view.addSubview(image)
        self.view.addSubview(imageShadow)
        self.view.addSubview(nameLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(map)
    }
    
    private func makeConstraint() {
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(descriptionLabel.snp.top).inset(-10)
            make.height.equalTo(250)
            make.width.equalToSuperview()
        }
        
        imageShadow.snp.makeConstraints { make in
            make.bottom.equalTo(image.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(image.snp.bottom).offset(-10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(map.snp.top).inset(-10)
        }
        
        map.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.width.equalTo(343)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getCoordinate()
        makeUI()
        makeConstraint()
        set()
        
        
    }
    
    private func set() {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let url = URL(string: self?.route.imageURL ?? ""),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image.image = image
            }
        }
        nameLabel.text = route.name
        descriptionLabel.text = route.detailDescription
    }
    
    private func createMarker(coordinate:CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fill
        let image = UIImageView()
        view.addArrangedSubview(image)
        image.image = UIImage(systemName: "gear")
        image.contentMode = .scaleAspectFit
        
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(10)
        }
        
        view.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
            
        }
        
        marker.iconView = view
        marker.map = map
        markers.append(marker)
    }

    private func getCoordinate() {
        guard let lat = Double(route.lat),
              let long = Double(route.long) else { return }
        let coord = CLLocationCoordinate2D(latitude: lat, longitude: long)
        self.createMarker(coordinate: coord)
        self.moveCamera(to: coord)
    }
    
    private func moveCamera(to: CLLocationCoordinate2D) {
        map.camera = GMSCameraPosition(target: to, zoom: 10)
    }
}
