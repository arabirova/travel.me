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
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func makeUI() {
        self.contentView.addSubview(view)
        self.view.addSubview(image)
        self.view.addSubview(nameLabel)
        self.view.addSubview(descriptionLabel)
    }
    
    private func makeConstraint() {
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top).inset(-10)
            make.height.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(descriptionLabel.snp.top).inset(-10)
            make.height.equalTo(21)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(21)
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
