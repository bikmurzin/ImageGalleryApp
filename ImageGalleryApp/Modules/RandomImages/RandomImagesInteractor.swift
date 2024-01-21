//
//  Project: ImageGalleryApp
//  File: RandomImagesInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//



protocol RandomImagesBusinessLogic: AnyObject {
    func loadData()
}

final class RandomImagesInteractor {
    
    private let presenter: RandomImagesPresentationLogic
    private let dataLoader = DataLoader()
    
    init(presenter: RandomImagesPresentationLogic) {
        self.presenter = presenter
    }
}

extension RandomImagesInteractor: RandomImagesBusinessLogic {
    func loadData() {
        var response: RandomImagesModels.Response = []
        for i in 0..<20 {
            response.append(dataLoader.loadData())
        }
        presenter.presentData(response: response)
    }
}
