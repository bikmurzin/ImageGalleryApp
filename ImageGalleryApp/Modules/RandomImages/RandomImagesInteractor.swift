//
//  Project: ImageGalleryApp
//  File: RandomImagesInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

protocol RandomImagesBusinessLogic: AnyObject {
    
}

final class RandomImagesInteractor {
    
    private let presenter: RandomImagesPresentationLogic
    
    init(presenter: RandomImagesPresentationLogic) {
        self.presenter = presenter
    }
}

extension RandomImagesInteractor: RandomImagesBusinessLogic {
    
}
