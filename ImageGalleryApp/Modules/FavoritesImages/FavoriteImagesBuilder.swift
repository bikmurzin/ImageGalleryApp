//
//  Project: ImageGalleryApp
//  File: FavoriteImagesBuilder.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

final class FavoriteImagesBuilder {
    func build() -> UIViewController {
        let presenter = FavoriteImagesPresenter()
        let interactor = FavoriteImagesInteractor(presenter: presenter)
        let viewController = FavoriteImagesViewController(interactor: interactor)

        presenter.viewController = viewController
        return viewController
    }
}
