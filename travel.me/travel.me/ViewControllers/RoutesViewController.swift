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
    
    var routes: [RouteModel] = [
        .init(
            imageURL: "https://34travel.me/media/upload/images/2021/November/kia-elnya/296A0597.jpg",
            name: "ОТ ЕЛЬНИ ДО ВОДОПАДА НА РЕКЕ ВЯТА",
            description: "Отправляемcя исследовать природные красоты и богатое архитектурное наследие.", detailDescription: "Мы продолжаем кататься по Беларуси в поисках природных и архитектурных жемчужин – и осень нам не помеха. На этот раз двигаем в одну из самых удивительных локаций Беларуси – к болоту Ельня. Как проще всего посмотреть Ельню и куда еще заехать в этом районе? Наш новый маршрут тебе в помощь.", coordinate: "55.57683391805365, 27.730498500250647"),
        
        .init(
            imageURL: "https://34travel.me/media/upload/images/2021/November/VTB/IMG_5873.jpg",
            name: "6 ИНТЕРЕСНЫХ МЕСТ НЕДАЛЕКО ОТ ВИТЕБСКА",
            description: "Дендропарк, ботанический заказник, усадьба Репина и другое.", detailDescription: "Если Витебск уже изучен вдоль и поперек, пора искать интересное в окрестностях. Собрали целых 6 вариантов для насыщенных вылазок недалеко от города, где и парки, и озера, и исторические усадьбы, и много других поводов не сидеть на дома. А если поехать на авто, путешествие по этим местам окажется еще и бесконтактным – то, что нужно по нынешним временам.", coordinate: "55.57683391805365, 27.730498500250647"),
        
        .init(
            imageURL: "https://34travel.me/media/upload/images/2021/OCTOBER/postavy-i-okrestnosti/296A0135.jpg",
            name: "ЕДЕМ В ПОСТАВЫ И ГУЛЯЕМ ПО ОКРЕСТНОСТИ",
            description: "Осенью там особенно красиво...", detailDescription: "Поставский район притягивает концентрацией уникальных для Беларуси мест, а наступившая осень обязательно эти места украсит еще сильнее. Проехать такой маршрут или его небольшую часть удобнее всего на личном авто, потому что добраться даже до Постав и не спеша вернуться в тот же день назад на общественном транспорте, к сожалению, почти невозможно. Зато этот маршрут удобен тем, что почти все его точки выстроились в линию и расположены на одной дороге.", coordinate: "55.57683391805365, 27.730498500250647"),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/OCTOBER/kia-museums/zaslauje/296A0405.jpg", name: "МУЗЕИ ПОД ОТКРЫТЫМ НЕБОМ НЕДАЛЕКО ОТ МИНСКА", description: "Хрупкое наследие деревянной архитектуры.", detailDescription: "На этот раз предлагаем прикоснуться к хрупкому наследию деревянной архитектуры – и открыть для себя музеи под открытым небом недалеко от Минска. Здесь можно погружаться в историю, узнавать новое о своей стране и знаменитых земляках, а еще – много гулять и любоваться глубинными беларусскими пейзажами. Каждый из этих музеев достоин отдельного путешествия, поэтому не рекомендуем стараться объехать их все за один раз. К тому же, закрываются музеи обычно довольно рано, так что обязательно смотри их графики работы перед выездом. И приятных открытий!", coordinate: "55.57683391805365, 27.730498500250647"),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/SEPTEMBER/kia-navahradak/296A9571.jpg", name: "НАСЫЩЕННОЕ ПУТЕШЕСТВИЕ ПО НОВОГРУДЧИНЕ", description: "Россыпи достопримечательностей и невероятные холмистые пейзажи.", detailDescription: "Мы любим путешествия не только за классные места с достопримечательностями, но и за саму дорогу: пейзажи за окном, неожиданные встречи, разговоры. Маршрут, в который мы отправимся сегодня, в этом смысле вдвойне прекрасен: кроме интересных мест с историей и изобилия архитектурных красот по пути нас ждут такие пейзажи, что иногда не верится, что и это тоже Беларусь – такая она красивая и разная каждый раз.", coordinate: "55.57683391805365, 27.730498500250647"),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/JULY/kia-zhemyslavl/296A8193.jpg", name: "УНИКАЛЬНЫЕ УСАДЬБЫ И НЕОГОТИЧЕСКИЕ КОСТЕЛЫ", description: "Пышный дворец, дом-крепость и целая оссыпь неоготического наследия.", detailDescription: "Продолжаем наполнять это лето впечатлениями и путешествиями по стране. У нас всегда найдется новая идея живописной вылазки – со старинной архитектурой, нежными пейзажами и удивительными историями. На этот раз отправляемся к самой границе с Литвой, где концентрация мощного культурного наследия максимально высока. Будет гарантированно круто!", coordinate: "55.57683391805365, 27.730498500250647"),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/JUNE/braslau/IMG_7724.jpg", name: "ЕДЕМ В ОЗЕРНЫЙ КРАЙ", description: "Достопримечательности, природные места и базы отдыха в самом курортном регионе.", detailDescription: "Лето в городе! По такому случаю подготовили для тебя явки и пароли для путешествия в самый курортный регион Беларуси. Здесь и крутые локации для отдыха, и интересные туристические точки, и классные развлечения – идеально!", coordinate: "55.57683391805365, 27.730498500250647"),
        
            .init(imageURL: "https://34travel.me/media/upload/images/2021/MAY/kia-brest/296A4809.jpg", name: "БОЛЬШОЕ ПУТЕШЕСТВИЕ ПО БРЕСТСКОЙ ОБЛАСТИ", description: "Все самое интересное в Бресте и окрестностях за одну поездку.", detailDescription: "Это не просто динамичная поездка выходного дня – здесь большое путешествие на целый уикенд с крутейшей программой. Важнейшие достопримечательности из учебников и совершенно скрытые от посторонних глаз места, модные локации большого города и уединенные природные тропы – путешествие мечты, не меньше!", coordinate: "55.57683391805365, 27.730498500250647"),
        .init(imageURL: "https://34travel.me/media/upload/images/2020/NOVEMBER/grodno/1vertelishki2.JPG", name: "ЕДЕМ ПО ГРОДНЕНСКОМУ РАЙОНУ", description: "Дворцы, храмы и советское наследие - что посмотреть в окрестностях королевского города.", detailDescription: "Уехать в Гродно – всегда отличная идея. А главная фишка в том, что не только сам королевский город полон достопримечательностей и отличных локаций, но и местность поблизости. Мы составили насыщенный маршрут, который идеально накладывается на путешествие в прекрасный Гродно. Главное – захвати с собой термос с горячим чаем и не забывай про маску и социальную дистанцию.", coordinate: "55.57683391805365, 27.730498500250647"),
        
            .init(imageURL: "https://34travel.me/media/posts/5ec65cf25b4ee-1500.jpg", name: "ОТ ЛЮБАНСКИХ КАРЬЕРОВ ДО ТАИНСТВЕННОЙ ПИРАМИДЫ", description: "Карьеры с лазурной водой и солигорские терриконы, уединенные церкви и пирамида на кладбище.", detailDescription: "Любанские карьеры, которые еще называют Голубыми озерами (не путай с теми, что возле Нарочи) – это идеальный эскейп на денек. Добавляй в маршрут солигорские терриконы, если еще не бывал(-а) там, уединенные уголки Слуцка, пару церквей и настоящую пирамиду на кладбище! Рассчитывай на 335 километров и 5 часов в дороге и, конечно, не забывай соблюдать дистанцию.", coordinate: "55.57683391805365, 27.730498500250647")
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
        let detailVC = RouteDetailsViewController(route: routes[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
