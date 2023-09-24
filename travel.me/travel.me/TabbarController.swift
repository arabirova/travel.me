//
//  TabbarController.swift
//  travel.me
//
//  Created by Сашка on 24.09.23.
//

import Foundation
import UIKit

final class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabbar()
    }
    
    private func setupTabbar() {
        let dataSource: [TabBarItem] = [.routes, .guides, .map, .favorites]
        self.viewControllers = dataSource.map {
            switch $0 {
            case .routes:
                let routesViewController = RoutesViewController()
                return self.wrappedInNavigationController(with: routesViewController, title: $0.title)
            case .guides:
                let guidesViewController = GuidesViewController()
                return self.wrappedInNavigationController(with: guidesViewController, title: $0.title)
            case .map:
                let mapViewController = MapViewController()
                return self.wrappedInNavigationController(with: mapViewController, title: $0.title)
            case .favorites:
                let favoritesViewController = FavoritesViewController()
                return self.wrappedInNavigationController(with: favoritesViewController, title: $0.title)
            }
        }
        
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            
        }
    }
    
    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
        return UINavigationController(rootViewController: with)
    }

    
}

private enum TabBarItem: Int {
    case routes
    case guides
    case map
    case favorites
    
    var title: String {
        switch self {
        case .routes:
            return "Маршруты"
        case .guides:
            return "Гайды"
        case .map:
            return "Карта"
        case .favorites:
            return "Избранное"
        
        }
    }
}

