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
    var guides: [GuideModel] = []
    var favCounter = 0
        
    lazy var routeTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.id)
        return table
    }()
    
    lazy var guideTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(FavoriteGuideCell.self, forCellReuseIdentifier: FavoriteGuideCell.id)
        return table
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let userDefaults = UserDefaults.standard
        if let savedData = userDefaults.object(forKey: "routes") as? Data {
            do{
                let savedContacts = try JSONDecoder().decode([RouteModel].self, from: savedData)
                routes = savedContacts
            } catch {
            }
        }

        makeTitle()
        makeUI()
        makeConstraints()

    }
    
    private func makeTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "#Избранное"
        titleLabel.textColor = .systemGreen
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.sizeToFit()

        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    private func makeUI() {
        self.view.addSubview(routeTableView)
        self.view.addSubview(guideTableView)

    }
    
    private func makeConstraints() {

        routeTableView.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.bottom.equalTo(guideTableView.snp.top)
            
        
        }
        guideTableView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(295)

        }
    }
    
    @objc func segmentAction(sender: UISegmentedControl) {

        }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == routeTableView {
            return routes.count
        } else if tableView == guideTableView {
            return guides.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == routeTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.id, for: indexPath)
            guard let favoriteCell = cell as? FavoriteCell else { return .init() }
            favoriteCell.set(route: routes[indexPath.row])
            return favoriteCell
        } else if tableView == guideTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteGuideCell.id, for: indexPath)
            guard let routeCell = cell as? FavoriteGuideCell else { return .init() }
            routeCell.set(guide: guides[indexPath.row])
            return routeCell
        } else {
            
            return UITableViewCell()
        }
    }
}

    extension FavoritesViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let detailVC = RouteDetailsViewController(route: routes[indexPath.row])
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }


