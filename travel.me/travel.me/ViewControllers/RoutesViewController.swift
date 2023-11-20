//
//  RoutesViewController.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import UIKit
import SnapKit
import GoogleMaps

class RoutesViewController: UIViewController {
    
    var routes: [RouteModel] = []
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(RouteCell.self, forCellReuseIdentifier: RouteCell.id)
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
        makeTitle()
        makeUI()
        makeConstraints()
        readList()
        changeNav()
    }
    
    private func makeTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "#Маршруты"
        titleLabel.textColor = .systemGreen
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.sizeToFit()

        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    private func makeUI() {
        self.view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func parseData(_ dict: [String: Any]) {
        routes.removeAll()
        for (_, value) in dict {
            guard let answer = value as? [String: Any] else { continue }
            guard let new = try? RouteModel(
                dict: answer
            ) else { return }
            self.routes.append(new)
        }
        
        self.tableView.reloadData()
    }
    
    private func readList() {
        Environment.ref.child("routes").observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let routeDict = (snapshot.value as? [String: Any]) else { return }
            self?.parseData(routeDict)
        })
    }
    
    private func changeNav() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension RoutesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: RouteCell.id, for: indexPath)
       guard let routeCell = cell as? RouteCell else { return .init() }
        routeCell.set(route: routes[indexPath.row])
       return routeCell
   }
}

extension RoutesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = RouteDetailsViewController(route: routes[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
