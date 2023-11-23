//
//  GuideDetailsViewController.swift
//  travel.me
//
//  Created by Сашка on 21.10.23.
//

import UIKit
import SnapKit
import GoogleMaps

class GuideDetailsViewController: UIViewController {
    
    private var guide: GuideModel
    
    init(guide: GuideModel) {
        self.guide = guide
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
    
    private var segment: UISegmentedControl = {
        let items = ["Транспорт", "Жилье", "Культура", "Еда"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentAction(sender:)), for: .valueChanged)
        return segment
    }()
    
    private lazy var aboutSegmentImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "travel")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var aboutSegmentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1000
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private func makeUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(image)
        self.contentView.addSubview(imageShadow)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(segment)
        self.contentView.addSubview(aboutSegmentImage)
        self.contentView.addSubview(aboutSegmentLabel)
        
        scrollView.contentInsetAdjustmentBehavior = .never
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
            make.bottom.equalTo(segment.snp.top).inset(-10)
        }
        
        segment.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalTo(aboutSegmentImage.snp.top).inset(-10)
        }
        
        aboutSegmentImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(237)
            make.width.equalTo(343)
            make.bottom.equalTo(aboutSegmentLabel.snp.top).inset(-10)
        }
        
        aboutSegmentLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .white
        makeUI()
        makeConstraint()
        set()
        setNavigationBar()
    }
    
    private func set() {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let url = URL(string: self?.guide.imageURL ?? ""),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data),
                  let urlTransport = URL(string: self?.guide.transportImageURL ?? ""),
                  let dataTransport = try? Data(contentsOf: urlTransport),
                  let imageTransport = UIImage(data: dataTransport)
            else { return }
            DispatchQueue.main.async { [weak self] in
                self?.image.image = image
                self?.aboutSegmentImage.image = imageTransport
            }
        }
        nameLabel.text = guide.name
        descriptionLabel.text = guide.detailDescription
        aboutSegmentLabel.text = guide.transport
    }
    
    @objc func segmentAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            aboutSegmentLabel.text = guide.transport
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                guard let urlTransport = URL(string: self?.guide.transportImageURL ?? ""),
                      let dataTransport = try? Data(contentsOf: urlTransport),
                      let imageTransport = UIImage(data: dataTransport)
                else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.aboutSegmentImage.image = imageTransport
                }
            }
        case 1:
            aboutSegmentLabel.text = guide.housing
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                guard let urlHousing = URL(string: self?.guide.housingImageURL ?? ""),
                      let dataHousing = try? Data(contentsOf: urlHousing),
                      let imageHousing = UIImage(data: dataHousing)
                else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.aboutSegmentImage.image = imageHousing
                }
            }
        case 2:
            aboutSegmentLabel.text = guide.culture
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                      guard let urlCulture = URL(string: self?.guide.cultureImageURL ?? ""),
                      let dataCulture = try? Data(contentsOf: urlCulture),
                      let imageCulture = UIImage(data: dataCulture)
                else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.aboutSegmentImage.image = imageCulture
                }
            }
        default:
            aboutSegmentLabel.text = guide.food
            DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                guard let urlFood = URL(string: self?.guide.foodImageURL ?? ""),
                      let dataTFood = try? Data(contentsOf: urlFood),
                      let imageFood = UIImage(data: dataTFood)
                else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.aboutSegmentImage.image = imageFood
                }
            }
        }
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

