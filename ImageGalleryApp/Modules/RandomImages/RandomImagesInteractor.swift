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
        var response = dataLoader.loadData(numberOfRequests: Constants.numberOfRequest)
        presenter.presentData(response: response)
    }
}

// MARK: - Constants
extension RandomImagesInteractor {
    enum Constants {
        static let numberOfRequest = 20
    }
}
