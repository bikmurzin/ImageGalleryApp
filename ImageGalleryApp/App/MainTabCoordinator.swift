//
//  Project: ImageGalleryApp
//  File: MainTabCoordinator.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

final class MainTabCoordinator: IMainTabCoordinator {
    
    var rootViewController: UIViewController = UITabBarController()
    
    func start() -> UIViewController {
        configTabBar()
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .blue
        firstVC.tabBarItem = UITabBarItem(title: "Меню", image: UIImage(systemName: "takeoutbag.and.cup.and.straw.fill"), tag: 0)
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .red
        secondVC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "basket.fill"), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [firstVC, secondVC]
        
        return rootViewController
    }
    
    private func configTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        (rootViewController as? UITabBarController)?.tabBar.standardAppearance = appearance
        (rootViewController as? UITabBarController)?.tabBar.scrollEdgeAppearance = appearance
        (rootViewController as? UITabBarController)?.tabBar.barTintColor = .red
    }
}
