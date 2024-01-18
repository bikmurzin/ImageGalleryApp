//
//  Project: ImageGalleryApp
//  File: Coordinator.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol ICoordinator {
    var rootViewController: UIViewController { get set }
    func start() -> UIViewController
}
