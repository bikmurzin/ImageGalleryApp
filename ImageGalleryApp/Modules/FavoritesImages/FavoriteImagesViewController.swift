//
//  Project: ImageGalleryApp
//  File: FavoriteImagesViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol FavoriteImagesDisplayLogic: AnyObject {
    
}

final class FavoriteImagesViewController: UIViewController {
    
    private let interactor: FavoriteImagesBusinessLogic
    
    init(interactor: FavoriteImagesBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
    }
}

extension FavoriteImagesViewController: FavoriteImagesDisplayLogic {
    
}
