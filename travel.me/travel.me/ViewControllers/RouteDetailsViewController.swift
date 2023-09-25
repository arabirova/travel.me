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
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 10
        return label
    }()
    
    private lazy var map: GMSMapView = {
        let map = GMSMapView()
        return map
    }()
    
    private func makeUI() {
        self.view.addSubview(image)
        self.view.addSubview(nameLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(map)
    }
    
    private func makeConstraint() {
        image.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top).inset(-5)
            make.height.equalTo(237)
            make.width.equalTo(343)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(16)
            make.bottom.equalTo(descriptionLabel.snp.top).inset(-5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(16)
            make.bottom.equalTo(map.snp.top).inset(-5)
        }
        
        map.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().offset(16)
            make.height.width.equalTo(50)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Маршрут"
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
}
