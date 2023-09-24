//
//  RouteCell.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import UIKit
import SnapKit

class RouteCell: UITableViewCell {
    static let id = String(describing: RouteCell.self)
    
    private lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
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
        label.numberOfLines = 2
        return label
    }()
    
    private func makeUI() {
        self.contentView.backgroundColor = .lightGray
        self.contentView.addSubview(view)
        self.view.addSubview(image)
        self.view.addSubview(nameLabel)
        self.view.addSubview(descriptionLabel)
    }
    
    private func makeConstraint() {
        view.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(4)
            make.bottom.equalTo(nameLabel.snp.top).inset(-5)
            make.height.equalTo(237)
            make.width.equalTo(343)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(descriptionLabel.snp.top).inset(-5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(5)
        }

    }
    
    func set(route: RouteModel) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let url = URL(string: route.imageURL),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image.image = image
            }
        }
        self.nameLabel.text = route.name
        self.descriptionLabel.text = route.description
        
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeUI()
        makeConstraint()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
