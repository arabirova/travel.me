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
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
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
    
    private lazy var oneCityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var oneCoordinatesCityLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var oneDescrCityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 100
        return label
    }()
    
    private lazy var oneImageCity: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "travel")
        return image
    }()
    
    private func makeUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(image)
        self.contentView.addSubview(imageShadow)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(map)
        self.contentView.addSubview(oneCityNameLabel)
        self.contentView.addSubview(oneCoordinatesCityLabel)
        self.contentView.addSubview(oneDescrCityLabel)
        self.contentView.addSubview(oneImageCity)
    }
    
    private func makeConstraint() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
            }

        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.view)
            make.width.height.top.bottom.equalTo(self.scrollView)
            }
        
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
        
        oneCityNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(map.snp.bottom).offset(10)
        }
        
        oneCoordinatesCityLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(oneCityNameLabel.snp.bottom).offset(5)
            make.height.equalTo(22)
        }
        
        oneDescrCityLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(oneCoordinatesCityLabel.snp.bottom).offset(5)
        }
        
        oneImageCity.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(oneDescrCityLabel.snp.bottom).offset(5)
            make.height.width.equalTo(200)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getCoordinate()
        makeUI()
        makeConstraint()
        set()
        setNavigationBar()
    }
    
    private func set() {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let url = URL(string: self?.route.imageURL ?? ""),
                  let urlOneCity = URL(string: self?.route.oneImageCityURL ?? ""),
                  let data = try? Data(contentsOf: url),
                  let dataOneCity = try? Data(contentsOf: urlOneCity),
                  let image = UIImage(data: data),
                  let imageOneCity = UIImage(data: dataOneCity)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image.image = image
                self?.oneImageCity.image = imageOneCity
            }
        }
        nameLabel.text = route.name
        descriptionLabel.text = route.detailDescription
        oneCityNameLabel.text = route.oneCityName
        oneCoordinatesCityLabel.text = route.oneCoordinatesCity
        oneDescrCityLabel.text = route.oneDescrCity
    }
    
    private func createMarker(coordinate:CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordinate)
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 0
        view.distribution = .fill
        let image = UIImageView()
        view.addArrangedSubview(image)
        image.image = UIImage(named: "mapPoint")
        image.contentMode = .scaleAspectFit
        
        
        image.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        
        view.snp.makeConstraints { make in
            make.height.width.equalTo(40)
            
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
    
    private func setNavigationBar() {
        
        self.navigationItem.setHidesBackButton(true, animated:false)
        let view = UIView()
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back"), for: .normal)
        let favoriteButton = UIButton()
        favoriteButton.setImage(UIImage(named: "favorite"), for: .normal)

        view.addSubview(backButton)
        view.addSubview(favoriteButton)
        
        view.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.width.equalTo(self.view.frame.width)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.height.width.equalTo(35)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing)
            make.height.width.equalTo(35)
        }


        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
        backButton.addGestureRecognizer(backTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }

    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }
}

