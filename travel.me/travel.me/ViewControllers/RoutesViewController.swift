//
//  RoutesViewController.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import UIKit
import SnapKit

class RoutesViewController: UIViewController {
    
    var routes: [RouteModel] = [
        .init(
            imageURL: "https://34travel.me/media/upload/images/2021/November/kia-elnya/296A0597.jpg",
            name: "ОТ ЕЛЬНИ ДО ВОДОПАДА НА РЕКЕ ВЯТА",
            description: "Отправляемcя исследовать природные красоты и богатое архитектурное наследие."),
        
        .init(
            imageURL: "https://34travel.me/media/upload/images/2021/November/VTB/IMG_5873.jpg",
            name: "6 ИНТЕРЕСНЫХ МЕСТ НЕДАЛЕКО ОТ ВИТЕБСКА",
            description: "Дендропарк, ботанический заказник, усадьба Репина и другое."),
        
        .init(
            imageURL: "https://34travel.me/media/upload/images/2021/OCTOBER/postavy-i-okrestnosti/296A0135.jpg",
            name: "ЕДЕМ В ПОСТАВЫ И ГУЛЯЕМ ПО ОКРЕСТНОСТИ",
            description: "Осенью там особенно красиво")
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
    
}
