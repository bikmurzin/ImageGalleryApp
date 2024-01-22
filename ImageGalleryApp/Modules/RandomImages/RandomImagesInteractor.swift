//
//  Project: ImageGalleryApp
//  File: RandomImagesInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import Foundation

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
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        var response = RandomImagesModels.Response()
        group.enter()
        queue.async {
             response = self.dataLoader.loadData(numberOfRequests: Constants.numberOfRequest)
            group.leave()
        }
        group.notify(queue: .main) {
            self.presenter.presentData(response: response)
        }
    }
}

// MARK: - Constants
extension RandomImagesInteractor {
    enum Constants {
        static let numberOfRequest = 20
    }
}
