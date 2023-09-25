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
            description: "Осенью там особенно красиво..."),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/OCTOBER/kia-museums/zaslauje/296A0405.jpg", name: "МУЗЕИ ПОД ОТКРЫТЫМ НЕБОМ НЕДАЛЕКО ОТ МИНСКА", description: "Хрупкое наследие деревянной архитектуры."),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/SEPTEMBER/kia-navahradak/296A9571.jpg", name: "НАСЫЩЕННОЕ ПУТЕШЕСТВИЕ ПО НОВОГРУДЧИНЕ", description: "Россыпи достопримечательностей и невероятные холмистые пейзажи."),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/JULY/kia-zhemyslavl/296A8193.jpg", name: "УНИКАЛЬНЫЕ УСАДЬБЫ И НЕОГОТИЧЕСКИЕ КОСТЕЛЫ", description: "Пышный дворец, дом-крепость и целая оссыпь неоготического наследия."),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/JUNE/braslau/IMG_7724.jpg", name: "ЕДЕМ В ОЗЕРНЫЙ КРАЙ", description: "Достопримечательности, природные места и базы отдыха в самом курортном регионе."),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/MAY/kia-brest/296A4809.jpg", name: "БОЛЬШОЕ ПУТЕШЕСТВИЕ ПО БРЕСТСКОЙ ОБЛАСТИ", description: "Все самое интересное в Бресте и окрестностях за одну поездку."),
        .init(imageURL: "https://34travel.me/media/upload/images/2020/NOVEMBER/grodno/1vertelishki2.JPG", name: "ЕДЕМ ПО ГРОДНЕНСКОМУ РАЙОНУ", description: "Дворцы, храмы и советское наследие - что посмотреть в окрестностях королевского города."),
        
            .init(imageURL: "https://34travel.me/media/posts/5ec65cf25b4ee-1500.jpg", name: "ОТ ЛЮБАНСКИХ КАРЬЕРОВ ДО ТАИНСТВЕННОЙ ПИРАМИДЫ", description: "Карьеры с лазурной водой и солигорские терриконы, уединенные церкви и пирамида на кладбище.")
    ]
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(RouteCell.self, forCellReuseIdentifier: RouteCell.id)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeTitle()
        makeUI()
        makeConstraints()
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
        let detailVC = RouteDetailsViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
