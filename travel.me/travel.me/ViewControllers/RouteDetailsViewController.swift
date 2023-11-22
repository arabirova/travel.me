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
        scroll.frame = view.bounds
        scroll.contentSize = contentSize
        return scroll
    }()
    
    private var contentSize: CGSize{
        CGSize(width: view.frame.width, height: view.frame.height + 4000)
    }
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.frame.size = contentSize
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
        label.numberOfLines = 100
        return label
    }()
    
    private lazy var oneImageCity: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "travel")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var twoCityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var twoCoordinatesCityLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var twoDescrCityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 100
        return label
    }()
    
    private lazy var twoImageCity: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "travel")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var threeCityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var threeCoordinatesCityLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var threeDescrCityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 100
        return label
    }()
    
    private lazy var threeImageCity: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "travel")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var fourCityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var fourCoordinatesCityLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var fourDescrCityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 100
        return label
    }()
    
    private lazy var fourImageCity: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "travel")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var fiveCityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private lazy var fiveCoordinatesCityLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var fiveDescrCityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 100
        return label
    }()
    
    private lazy var fiveImageCity: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
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
        
        self.contentView.addSubview(twoCityNameLabel)
        self.contentView.addSubview(twoCoordinatesCityLabel)
        self.contentView.addSubview(twoDescrCityLabel)
        self.contentView.addSubview(twoImageCity)
        
        self.contentView.addSubview(threeCityNameLabel)
        self.contentView.addSubview(threeCoordinatesCityLabel)
        self.contentView.addSubview(threeDescrCityLabel)
        self.contentView.addSubview(threeImageCity)
        
        self.contentView.addSubview(fourCityNameLabel)
        self.contentView.addSubview(fourCoordinatesCityLabel)
        self.contentView.addSubview(fourDescrCityLabel)
        self.contentView.addSubview(fourImageCity)
        
        self.contentView.addSubview(fiveCityNameLabel)
        self.contentView.addSubview(fiveCoordinatesCityLabel)
        self.contentView.addSubview(fiveDescrCityLabel)
        self.contentView.addSubview(fiveImageCity)
        
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    private func makeConstraint() {
        
        
        image.snp.makeConstraints { make in
            make.top.equalTo(self.contentView)
            make.bottom.equalTo(descriptionLabel.snp.top).inset(-10)
            make.height.equalTo(250)
            make.width.equalTo(self.contentView)
        }
        
        imageShadow.snp.makeConstraints { make in
            make.bottom.equalTo(image.snp.bottom)
            make.width.equalTo(self.contentView)
            make.height.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self.contentView)
            make.bottom.equalTo(image.snp.bottom).offset(-10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.bottom.equalTo(map.snp.top).inset(-10)
        }
        
        map.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.height.width.equalTo(343)
            
        }
        
        oneCityNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(map.snp.bottom).offset(10)
        }
        
        oneCoordinatesCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(oneCityNameLabel.snp.bottom).offset(5)
            make.height.equalTo(22)
        }
        
        oneDescrCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(oneCoordinatesCityLabel.snp.bottom).offset(5)
        }
        
        oneImageCity.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(oneDescrCityLabel.snp.bottom).offset(5)
            make.height.equalTo(237)
            make.width.equalTo(343)
        }
        
        twoCityNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(oneImageCity.snp.bottom).offset(10)
        }
        
        twoCoordinatesCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(twoCityNameLabel.snp.bottom).offset(5)
            make.height.equalTo(22)
        }
        
        twoDescrCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(twoCoordinatesCityLabel.snp.bottom).offset(5)
        }
        
        twoImageCity.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(twoDescrCityLabel.snp.bottom).offset(5)
            make.height.equalTo(237)
            make.width.equalTo(343)
        }
        
        threeCityNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(twoImageCity.snp.bottom).offset(10)
        }
        
        threeCoordinatesCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(threeCityNameLabel.snp.bottom).offset(5)
            make.height.equalTo(22)
        }
        
        threeDescrCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(threeCoordinatesCityLabel.snp.bottom).offset(5)
        }
        
        threeImageCity.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(threeDescrCityLabel.snp.bottom).offset(5)
            make.height.equalTo(237)
            make.width.equalTo(343)
        }
        
        fourCityNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(threeImageCity.snp.bottom).offset(10)
        }
        
        fourCoordinatesCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(fourCityNameLabel.snp.bottom).offset(5)
            make.height.equalTo(22)
        }
        
        fourDescrCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(fourCoordinatesCityLabel.snp.bottom).offset(5)
        }
        
        fourImageCity.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(fourDescrCityLabel.snp.bottom).offset(5)
            make.height.equalTo(237)
            make.width.equalTo(343)
        }
        
        fiveCityNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(fourImageCity.snp.bottom).offset(10)
        }
        
        fiveCoordinatesCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(fiveCityNameLabel.snp.bottom).offset(5)
            make.height.equalTo(22)
        }
        
        fiveDescrCityLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(fiveCoordinatesCityLabel.snp.bottom).offset(5)
        }
        
        fiveImageCity.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView).offset(16)
            make.trailing.equalTo(self.contentView).offset(-16)
            make.top.equalTo(fiveDescrCityLabel.snp.bottom).offset(5)
            make.height.equalTo(237)
            make.width.equalTo(343)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
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
                  let urlTwoCity = URL(string: self?.route.twoImageCityURL ?? ""),
                  let urlThreeCity = URL(string: self?.route.threeImageCityURL ?? ""),
                  let urlFourCity = URL(string: self?.route.fourImageCityURL ?? ""),
                  let urlFiveCity = URL(string: self?.route.fiveImageCityURL ?? ""),
                    
                  let data = try? Data(contentsOf: url),
                  
                  let dataOneCity = try? Data(contentsOf: urlOneCity),
                  let dataTwoCity = try? Data(contentsOf: urlTwoCity),
                  let dataThreeCity = try? Data(contentsOf: urlThreeCity),
                  let dataFourCity = try? Data(contentsOf: urlFourCity),
                  let dataFiveCity = try? Data(contentsOf: urlFiveCity),
                  
                    
                  let image = UIImage(data: data),
                  
                  let imageOneCity = UIImage(data: dataOneCity),
                  let imageTwoCity = UIImage(data: dataTwoCity),
                  let imageThreeCity = UIImage(data: dataThreeCity),
                  let imageFourCity = UIImage(data: dataFourCity),
                  let imageFiveCity = UIImage(data: dataFiveCity)
                    
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image.image = image
                self?.oneImageCity.image = imageOneCity
                self?.twoImageCity.image = imageTwoCity
                self?.threeImageCity.image = imageThreeCity
                self?.fourImageCity.image = imageFourCity
                self?.fiveImageCity.image = imageFiveCity
            }
        }
        nameLabel.text = route.name
        descriptionLabel.text = route.detailDescription
        
        oneCityNameLabel.text = route.oneCityName
        oneCoordinatesCityLabel.text = route.oneCoordinatesCity
        oneDescrCityLabel.text = route.oneDescrCity
        
        twoCityNameLabel.text = route.twoCityName
        twoCoordinatesCityLabel.text = route.twoCoordinatesCity
        twoDescrCityLabel.text = route.twoDescrCity
        
        threeCityNameLabel.text = route.threeCityName
        threeCoordinatesCityLabel.text = route.threeCoordinatesCity
        threeDescrCityLabel.text = route.threeDescrCity
        
        fourCityNameLabel.text = route.fourCityName
        fourCoordinatesCityLabel.text = route.fourCoordinatesCity
        fourDescrCityLabel.text = route.fourDescrCity
        
        fiveCityNameLabel.text = route.fiveCityName
        fiveCoordinatesCityLabel.text = route.fiveCoordinatesCity
        fiveDescrCityLabel.text = route.fiveDescrCity
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
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
}

