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
    private var counter = 0
    private var favCounter = 0
    
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
        CGSize(width: view.frame.width, height: view.frame.height + 4500)
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
        image.image = UIImage(named: "travel")
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
        getCoordinate()
        makeUI()
        makeConstraint()
        set()
        checkNavigationBar()
        map.delegate = self
    }
    
    func checkNavigationBar() {
        guard let last = self.tabBarController?.viewControllers?.last else { return }
        guard let nav = last.tabBarController?.viewControllers?.last as? UINavigationController else { return }
        let lastVCInNavController = nav.viewControllers.last
        let convertedProfileVC = lastVCInNavController as? FavoritesViewController
        guard let convertedProfileVC else { return }
        if convertedProfileVC.routes.contains(where: { $0 === route }) {
            setNavigationBarFavorite()
        } else {
            setNavigationBar()
        }
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
    
    private func createMarker(coordinate:CLLocationCoordinate2D, dict: [String: Any]) {
        let marker = GMSMarker(position: coordinate)
        counter += 1
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 11)
        view.addArrangedSubview(label)
        label.text = "\(counter)"
        
        view.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
        
        marker.iconView = view
        marker.map = map
        marker.userData = dict
        markers.append(marker)
    }

    private func getCoordinate() {
        guard let latOne = Double(route.latOne),
              let longOne = Double(route.longOne)
        else { return }
        let coordOne = CLLocationCoordinate2D(latitude: latOne, longitude: longOne)
        let nameOne = route.oneCityName
        let imageURLOne = route.oneImageCityURL
        let detailDescriptionOne = ""
        let coordinatesOne = route.oneCoordinatesCity
        let openURLOne = route.openURL
        
        let dictOne = ["name": nameOne, "description": detailDescriptionOne,"imageURL": imageURLOne, "coordinates": coordinatesOne, "openURL": openURLOne]
        self.createMarker(coordinate: coordOne, dict: dictOne)
        self.moveCamera(to: coordOne)

        guard let latTwo = Double(route.latTwo),
              let longTwo = Double(route.longTwo)
        else { return }
        let coordTwo = CLLocationCoordinate2D(latitude: latTwo, longitude: longTwo)
        let nameTwo = route.twoCityName
        let imageURLTwo = route.twoImageCityURL
        let detailDescriptionTwo = ""
        let coordinatesTwo = route.twoCoordinatesCity
        let openURLTwo = route.openURL
        let dictTwo = ["name": nameTwo, "description": detailDescriptionTwo,"imageURL": imageURLTwo, "coordinates": coordinatesTwo, "openURL": openURLTwo]
        self.createMarker(coordinate: coordTwo, dict: dictTwo)

        guard let latThree = Double(route.latThree),
              let longThree = Double(route.longThree)
        else { return }
        let coordThree = CLLocationCoordinate2D(latitude: latThree, longitude: longThree)
        let nameThree = route.threeCityName
        let imageURLThree = route.threeImageCityURL
        let detailDescriptionThree = ""
        let coordinatesThree = route.threeCoordinatesCity
        let openURLThree = route.openURL
        let dictThree = ["name": nameThree, "description": detailDescriptionThree,"imageURL": imageURLThree, "coordinates": coordinatesThree, "openURL": openURLThree]
        self.createMarker(coordinate: coordThree, dict: dictThree)
                
        guard let latFour = Double(route.latFour),
              let longFour = Double(route.longFour)
        else { return }
        let coordFour = CLLocationCoordinate2D(latitude: latFour, longitude: longFour)
        let nameFour = route.fourCityName
        let imageURLFour = route.fourImageCityURL
        let detailDescriptionFour = ""
        let coordinatesFour = route.fourCoordinatesCity
        let openURLFour = route.openURL
        let dictFour = ["name": nameFour, "description": detailDescriptionFour,"imageURL": imageURLFour, "coordinates": coordinatesFour, "openURL": openURLFour]
        self.createMarker(coordinate: coordFour, dict: dictFour)

        guard let latFive = Double(route.latFive),
              let longFive = Double(route.longFive)
        else { return }
        let coordFive = CLLocationCoordinate2D(latitude: latFive, longitude: longFive)
        let nameFive = route.fiveCityName
        let imageURLFive = route.fiveImageCityURL
        let detailDescriptionFive = ""
        let coordinatesFive = route.fiveCoordinatesCity
        let openURLFive = route.openURL
        let dictFive = ["name": nameFive, "imageURL": imageURLFive, "description": detailDescriptionFive, "coordinates": coordinatesFive, "openURL": openURLFive]
        self.createMarker(coordinate: coordFive, dict: dictFive)
    }
    
    private func moveCamera(to: CLLocationCoordinate2D) {
        map.camera = GMSCameraPosition(target: to, zoom: 8)
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
        let favoriteTap = UITapGestureRecognizer(target: self, action: #selector(favoriteAction))
        favoriteButton.addGestureRecognizer(favoriteTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func setNavigationBarFavorite() {
        
        self.navigationItem.setHidesBackButton(true, animated:false)
        let view = UIView()
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back"), for: .normal)
        let favoriteButton = UIButton()
        favoriteButton.setImage(UIImage(named: "favoriteActive"), for: .normal)

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
        let favoriteTap = UITapGestureRecognizer(target: self, action: #selector(favoriteAction))
        favoriteButton.addGestureRecognizer(favoriteTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }


    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func favoriteAction() {
        guard let last = self.tabBarController?.viewControllers?.last else { return }
        guard let nav = last.tabBarController?.viewControllers?.last as? UINavigationController else { return }
        let lastVCInNavController = nav.viewControllers.last
        let convertedProfileVC = lastVCInNavController as? FavoritesViewController
        guard let convertedProfileVC else { return }
        if convertedProfileVC.routes.contains(where: { $0 === route }) {
            if convertedProfileVC.favCounter > 1 {
                convertedProfileVC.favCounter -= 1
                last.tabBarController?.tabBar.items?.last?.badgeValue = "\(convertedProfileVC.favCounter)"
            } else {
                convertedProfileVC.favCounter -= 1
                last.tabBarController?.tabBar.items?.last?.badgeValue = nil
            }
            let conv = convertedProfileVC.routes.filter(){$0 !== route}
            convertedProfileVC.routes = conv
            let encodedData = try? JSONEncoder().encode(convertedProfileVC.routes)
            let userDefaults = UserDefaults.standard
            userDefaults.set(encodedData, forKey: "routes")
            convertedProfileVC.routeTableView.reloadData()
            setNavigationBar()
            
            print("Повтор значения")
        } else {
            convertedProfileVC.favCounter += 1
            last.tabBarController?.tabBar.items?.last?.badgeValue = "\(convertedProfileVC.favCounter)"
            convertedProfileVC.routes.append(route)
            setNavigationBarFavorite()
            let encodedData = try? JSONEncoder().encode(convertedProfileVC.routes)
            let userDefaults = UserDefaults.standard
            userDefaults.set(encodedData, forKey: "routes")
            convertedProfileVC.routeTableView.reloadData()
            
        }
    }
}

extension RouteDetailsViewController: GMSMapViewDelegate {
    
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

