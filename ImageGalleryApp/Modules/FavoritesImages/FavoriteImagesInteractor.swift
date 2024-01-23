//
//  Project: ImageGalleryApp
//  File: FavoriteImagesInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import Foundation

protocol FavoriteImagesBusinessLogic: AnyObject {
    func loadData()
    func deleteFromFavorites(request: FavoriteImagesModels.Request)
}

final class FavoriteImagesInteractor {
    
    private let presenter: FavoriteImagesPresentationLogic
    private lazy var fileWorker = FileWorker()
    private lazy var realmManager = RealmManager()
    private var loadedImages = [FavoriteImagesModels.Response.DataModel]()
    
    init(presenter: FavoriteImagesPresentationLogic) {
        self.presenter = presenter
    }
    
    private func loadSavedData() {
        let dbItems = realmManager.loadDataFromDB()
        for dbItem in dbItems {
            if let url = URL(string: dbItem.filePath) {
                let data = fileWorker.loadData(fileName: "\(dbItem.imageId)\(Constants.endNameOfFile)")
                let loadedImage = FavoriteImagesModels.Response.DataModel(data: data, imageId: String(dbItem.imageId), isFavorite: dbItem.isFavorite, filePath: url)
                self.loadedImages.append(loadedImage)
            }
        }
    }
}

// MARK: - FavoriteImagesBusinessLogic
extension FavoriteImagesInteractor: FavoriteImagesBusinessLogic {
    
    func loadData() {
        self.loadSavedData()
        let response = FavoriteImagesModels.Response(dataArray: self.loadedImages)
        self.presenter.presentData(response: response)
    }
    
    func deleteFromFavorites(request: FavoriteImagesModels.Request) {
        
    }
}

// MARK: - Constants
extension FavoriteImagesInteractor {
    enum Constants {
        static let endNameOfFile: String = ".jpg"
    }
}
