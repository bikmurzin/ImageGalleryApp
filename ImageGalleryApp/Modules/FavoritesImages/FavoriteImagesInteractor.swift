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
    private var fileWorker: IFileWorker
    private var realmManager: IRealmManager
    private var loadedImages = [FavoriteImagesModels.Response.DataModel]()
    
    init(
        presenter: FavoriteImagesPresentationLogic,
        fileWorker: IFileWorker = FileWorker(),
        realmManager: IRealmManager = RealmManager()
    ) {
        self.presenter = presenter
        self.fileWorker = fileWorker
        self.realmManager = realmManager
    }
    
    private func loadSavedData() {
        let dbItems = realmManager.loadDataFromDB()
        loadedImages.removeAll()
        for dbItem in dbItems {
            if let url = URL(string: dbItem.filePath) {
                let data = fileWorker.loadData(fileName: "\(dbItem.imageId)\(Constants.endNameOfFile)")
                let loadedImage = FavoriteImagesModels.Response.DataModel(data: data, imageId: String(dbItem.imageId), isFavorite: dbItem.isFavorite, filePath: url)
                self.loadedImages.append(loadedImage)
            }
        }
    }
    
    private func deleteImage(elementId: Int) {
        guard loadedImages.count > elementId else {
            return
        }
        let loadedImage = loadedImages[elementId]
        if let intImageId = Int(loadedImage.imageId) {
            realmManager.deleteDataFromDB(imageId: intImageId)
            fileWorker.deleteFile(fileName: "\(intImageId)\(Constants.endNameOfFile)")
        }
        loadedImages.remove(at: elementId)
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
        deleteImage(elementId: request.elementId)
        let response = FavoriteImagesModels.Response(dataArray: self.loadedImages)
        self.presenter.presentData(response: response)
    }
}

// MARK: - Constants
extension FavoriteImagesInteractor {
    enum Constants {
        static let endNameOfFile: String = ".jpg"
    }
}
