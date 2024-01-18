//
//  Project: ImageGalleryApp
//  File: FavoriteImagesInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

protocol FavoriteImagesBusinessLogic: AnyObject {
    
}

final class FavoriteImagesInteractor {
    
    private let presenter: FavoriteImagesPresentationLogic
    
    init(presenter: FavoriteImagesPresentationLogic) {
        self.presenter = presenter
    }
}

extension FavoriteImagesInteractor: FavoriteImagesBusinessLogic {
    
}
