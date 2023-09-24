//
//  RoutesViewController.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import UIKit
import SnapKit

class RoutesViewController: UIViewController {
    
    var routesPoints = Routes.allCases
    var routes: [RouteModel] = [
        .init(imageURL: "https://34travel.me/media/upload/images/2021/November/kia-elnya/296A8833.jpg", name: "ОТ ЕЛЬНИ ДО ВОДОПАДА НА РЕКЕ ВЯТА", description: "Отправляемчя исследовать природные красоты и богатое архитектурное наследие"),
        .init(imageURL: "https://34travel.me/media/upload/images/2021/November/kia-elnya/296A8833.jpg", name: "ОТ ЕЛЬНИ ДО ВОДОПАДА НА РЕКЕ ВЯТА", description: "Отправляемчя исследовать природные красоты и богатое архитектурное наследие"),
        .init(imageURL: "https://34travel.me/media/upload/images/2021/November/kia-elnya/296A8833.jpg", name: "ОТ ЕЛЬНИ ДО ВОДОПАДА НА РЕКЕ ВЯТА", description: "Отправляемчя исследовать природные красоты и богатое архитектурное наследие")
    ]
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(RouteCell.self, forCellReuseIdentifier: RouteCell.id)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Маршруты"
        makeUI()
        makeConstraints()
    }
    
    private func makeUI() {
        self.view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension RoutesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routesPoints.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: RouteCell.id, for: indexPath)
       guard let routeCell = cell as? RouteCell else { return .init() }
        routeCell.set(route: routes[indexPath.row])
       return routeCell
   }
}

extension RoutesViewController: UITableViewDelegate {
    
}
