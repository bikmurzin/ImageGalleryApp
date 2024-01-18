//
//  Project: ImageGalleryApp
//  File: RandomImagesBuilder.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

final class RandomImagesBuilder {
    func build() -> UIViewController {
        let presenter = RandomImagesPresenter()
        let interactor = RandomImagesInteractor(presenter: presenter)
        let viewController = RandomImagesViewController(interactor: interactor)

        presenter.viewController = viewController
        return viewController
    }
}
