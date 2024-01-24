//
//  Project: ImageGalleryApp
//  File: MainTabCoordinator.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

final class MainTabCoordinator {
    
    var rootViewController: UIViewController = UITabBarController()
    
    func start() -> UIViewController {
        
        configTabBar()
        
        let randomImagesBuilder = RandomImagesBuilder()
        let randomImagesVC = randomImagesBuilder.build()
        randomImagesVC.tabBarItem = UITabBarItem(title: Constants.randomImagesTabName, image: Constants.randomImagesTabImage, tag: 0)
        
        let favoriteImagesBuilder = FavoriteImagesBuilder()
        let favoriteImagesVC = favoriteImagesBuilder.build()
        favoriteImagesVC.tabBarItem = UITabBarItem(title: Constants.favoriteImagesTabName, image: Constants.favoriteImagesTabImage, tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [randomImagesVC, favoriteImagesVC]
        
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

extension MainTabCoordinator {
    enum Constants {
        static let randomImagesTabName: String = "Лента"
        static let randomImagesTabImage: UIImage? = UIImage(systemName: "film")
        static let favoriteImagesTabName: String = "Избранное"
        static let favoriteImagesTabImage: UIImage? = UIImage(systemName: "heart.circle")
    }
}
