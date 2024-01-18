//
//  Project: ImageGalleryApp
//  File: RandomImagesViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol RandomImagesDisplayLogic: AnyObject {
    
}

final class RandomImagesViewController: UIViewController {
    
    private let interactor: RandomImagesBusinessLogic
    
    init(interactor: RandomImagesBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .green
    }
}

extension RandomImagesViewController: RandomImagesDisplayLogic {
    
}
