//
//  Project: ImageGalleryApp
//  File: FavoriteImagesPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

protocol FavoriteImagesPresentationLogic: AnyObject {
    
}

final class FavoriteImagesPresenter {
    
    weak var viewController: FavoriteImagesDisplayLogic?
}

extension FavoriteImagesPresenter: FavoriteImagesPresentationLogic {
    
}
