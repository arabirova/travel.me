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
    private var coordinates: String
    private var openURL: String

    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
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
        stack.spacing = 6
        return stack
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var coordinatesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .italicSystemFont(ofSize: 12)
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
        label.textAlignment = .center
        label.numberOfLines = 100
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var openURLButton: UIButton = {
        let button = UIButton()
        button.setTitle("Почитать подробнее на сайте ->", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(openURLAction), for: .touchUpInside)
        return button
    }()
    
    init(name: String, detailDescription: String, imageURL: String, coordinates: String, openURL: String) {
        self.name = name
        self.detailDescription = detailDescription
        self.imageURL = imageURL
        self.coordinates = coordinates
        self.openURL = openURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
        makeLayout()
        makeConstraints()
        makeGestures()
        
    }
    
    private func makeLayout() {
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.addSubview(mainView)
        mainView.addSubview(cancelButton)
        mainView.addSubview(contentStack)
        contentStack.addArrangedSubview(nameLabel)
        contentStack.addArrangedSubview(coordinatesLabel)
        contentStack.addArrangedSubview(descriptionLabel)
        mainView.addSubview(image)
        mainView.addSubview(openURLButton)
    }
    
    private func makeConstraints() {
        mainView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(12)
            make.top.equalToSuperview().inset(12)
            make.bottom.equalTo(contentStack.snp.top)
            make.height.width.equalTo(30)
        }
        
        contentStack.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(image.snp.top).inset(-6)
        }
        
        image.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(openURLButton.snp.top).inset(-6)
            make.height.width.equalTo(250)
        }
        
        openURLButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
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
        coordinatesLabel.text = self.coordinates
        descriptionLabel.text = self.detailDescription
    }
    
    private func makeGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func close() {
        self.dismiss(animated: true)
    }
    
    @objc private func openURLAction() {
        guard let url = URL(string: "\(self.openURL)") else { return }
        UIApplication.shared.open(url)
    }
}

