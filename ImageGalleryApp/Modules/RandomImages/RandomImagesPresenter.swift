//
//  Project: ImageGalleryApp
//  File: RandomImagesPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

protocol RandomImagesPresentationLogic: AnyObject {
    
}

final class RandomImagesPresenter {
    
    weak var viewController: RandomImagesDisplayLogic?
}

extension RandomImagesPresenter: RandomImagesPresentationLogic {
    
}
