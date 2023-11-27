//
//  FavoritesViewController.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import UIKit
import SnapKit

class FavoritesViewController: UIViewController {
    
    var routes: [RouteModel] = []
    var favCounter = 0
        
    lazy var routeTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.id)
        return table
    }()
    
    lazy var emptyImage: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "emptyImage")
       return view
   }()
    
     lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Пока здесь пусто..."
         label.textAlignment = .center
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        checkFavorite()
        makeTitle()
        makeUI()
        makeConstraints()
        favRoutes()
    }
    
    private func checkFavorite() {
        let userDefaults = UserDefaults.standard
        if let savedData = userDefaults.object(forKey: "routes") as? Data {
            do{
                let savedContacts = try JSONDecoder().decode([RouteModel].self, from: savedData)
                self.routes = savedContacts
                favCounter = self.routes.count
                guard let last = self.tabBarController?.viewControllers?.last else { return }
                if favCounter != 0 {
                    last.tabBarController?.tabBar.items?.last?.badgeValue = "\(favCounter)"
                } else {
                    last.tabBarController?.tabBar.items?.last?.badgeValue = nil
                }
            } catch {
            }
        }
    }
    
    func favRoutes() {
        if routes.isEmpty {
            label.isHidden = false
            emptyImage.isHidden = false
        } else {
            label.isHidden = true
            emptyImage.isHidden = true
        }
    }
    
    private func makeTitle() {
        self.navigationItem.setHidesBackButton(true, animated:false)
        let view = UIView()

        let titleLabel = UILabel()
        titleLabel.text = "#Избранное"
        titleLabel.textColor = .systemGreen
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.sizeToFit()
        
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.tintColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(deleteButton)
        
        view.snp.makeConstraints { make in
            make.height.equalTo(self.view.frame.height)
            make.width.equalTo(self.view.frame.width)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing)
            make.centerY.equalTo(view.snp.centerY)
            make.height.width.equalTo(35)
        }
        
        let deleteTap = UITapGestureRecognizer(target: self, action: #selector(deleteAction))
        deleteButton.addGestureRecognizer(deleteTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    private func makeUI() {
        self.view.addSubview(routeTableView)
        self.view.addSubview(emptyImage)
        self.view.addSubview(label)
    }
    
    private func makeConstraints() {
        routeTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        emptyImage.snp.makeConstraints { make in
            make.centerY.equalTo(view.snp.centerY)
            make.centerX.equalTo(view.snp.centerX)
            make.height.width.equalTo(300)

        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(emptyImage.snp.bottom)
            make.trailing.leading.equalToSuperview()

        }
    }

    
    @objc func deleteAction() {
        routes.removeAll()
        self.favCounter = 0
        routeTableView.reloadData()
        let encodedData = try? JSONEncoder().encode(routes)
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedData, forKey: "routes")
        guard let last = self.tabBarController?.viewControllers?.last else { return }
        last.tabBarController?.tabBar.items?.last?.badgeValue = nil
        favRoutes()
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return routes.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.id, for: indexPath)
        
            guard let favoriteCell = cell as? FavoriteCell else { return .init() }
            favoriteCell.setCell(route: routes[indexPath.row])
            return favoriteCell
    }
}

    extension FavoritesViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let first = self.tabBarController?.viewControllers?.first else { return }
            guard let nav = first.tabBarController?.viewControllers?.first as? UINavigationController else { return }
            self.tabBarController?.selectedIndex = 0
            nav.popToRootViewController(animated: true)
           
            guard let routesVC = nav.viewControllers.first as? RoutesViewController else { return }
            routesVC.navigationController?.pushViewController(RouteDetailsViewController(route: routes[indexPath.row]), animated: true)
        }
    }


