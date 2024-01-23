//
//  Project: ImageGalleryApp
//  File: FavoriteImagesViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol FavoriteImagesDisplayLogic: AnyObject {
    func displayData(viewModel: FavoriteImagesModels.ViewModel)
}

final class FavoriteImagesViewController: UIViewController {
    
    private let interactor: FavoriteImagesBusinessLogic
    private let favoriteImagesView = FavoriteImagesView()
    
    init(interactor: FavoriteImagesBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = favoriteImagesView
        favoriteImagesView.delegate = self
        interactor.loadData()
    }
}

// MARK: - FavoriteImagesDisplayLogic
extension FavoriteImagesViewController: FavoriteImagesDisplayLogic {
    func displayData(viewModel: FavoriteImagesModels.ViewModel) {
        favoriteImagesView.addImageCard(viewModel: viewModel)
    }
}

// MARK: - FavoriteImagesViewDelegate
extension FavoriteImagesViewController: FavoriteImagesViewDelegate {
    func deleteFromFavorites(cellID: Int, isFavorite: Bool) {
        interactor.deleteFromFavorites(request: FavoriteImagesModels.Request(elementId: cellID))
    }
}
