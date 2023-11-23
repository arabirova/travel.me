//
//  MarkerViewController.swift
//  travel.me
//
//  Created by Сашка on 23.11.23.
//

import UIKit
import SnapKit

class MarkerViewController: UIViewController {
    
    private var name: String
    private var detailDescription: String
    private var imageURL: String

    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cancel"), for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()
    
    private lazy var contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        return stack
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Заголовок"
        label.textAlignment = .center
        label.numberOfLines = 2 //сколько линий строк
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var coordinatesLabel: UILabel = {
        let label = UILabel()
        label.text = "Подзаголовок"
        label.textAlignment = .center
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "travel")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание"
        label.textAlignment = .center
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    init(name: String, detailDescription: String, imageURL: String) {
        self.name = name
        self.detailDescription = detailDescription
        self.imageURL = imageURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        makeConstraints()
        set()
        makeGestures()
        
    }
    
    private func makeLayout() {
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.addSubview(mainView)
        mainView.addSubview(cancelButton)
        mainView.addSubview(contentStack)
        mainView.addSubview(image)
        contentStack.addArrangedSubview(nameLabel)
        contentStack.addArrangedSubview(coordinatesLabel)
        contentStack.addArrangedSubview(descriptionLabel)


    }
    
    private func makeConstraints() {
        mainView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(30)
        }
        
        contentStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(cancelButton.snp.bottom)
        }
        
        image.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(contentStack.snp.bottom)
            make.height.width.equalTo(250)
        }
    }
    
    private func set() {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let url = URL(string: self?.imageURL ?? ""),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image.image = image
            }
        }
        nameLabel.text = self.name
        descriptionLabel.text = self.detailDescription
    }
    
    private func makeGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func close() {
        self.dismiss(animated: true)
        print("1")
    }
}

