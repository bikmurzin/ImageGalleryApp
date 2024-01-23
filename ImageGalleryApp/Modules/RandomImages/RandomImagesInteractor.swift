//
//  Project: ImageGalleryApp
//  File: RandomImagesInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import Foundation

protocol RandomImagesBusinessLogic: AnyObject {
    func loadData()
    func toggleImageStatus(request: RandomImagesFileWorkingModels.Request)
}

final class RandomImagesInteractor {
    
    private let presenter: RandomImagesPresentationLogic
    private let dataLoader = DataLoader()
    private lazy var fileWorker = FileWorker()
    private lazy var realmManager = RealmManager()
    private var loadedImages = [RandomImagesModels.Response.DataModel]()
    
    init(presenter: RandomImagesPresentationLogic) {
        self.presenter = presenter
    }
    
    private func saveDataToFile(data: Data?, fileId: String?) -> URL? {
        guard let data = data,
              let unwrFileId = fileId,
              let intFileId = Int(unwrFileId)
        else { return nil }
        let url = fileWorker.saveDataToFile(data: data, fileName: "\(intFileId).jpg")
        return url
    }
    
    private func saveDataToDB(imageModel: ImageModel) {
        realmManager.saveDataToDB(model: ImageModel(imageId: imageModel.imageId, filePath: imageModel.filePath, isFavorite: imageModel.isFavorite))
    }
}

extension RandomImagesInteractor: RandomImagesBusinessLogic {
    
    func loadData() {
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        group.enter()
        queue.async {
            let result = self.dataLoader.loadData(numberOfRequests: Constants.numberOfRequest)
            self.loadedImages.append(contentsOf: result.map({ data, urlResponse in
                let imageId = urlResponse?.headerField(forKey: Constants.uniqueImageIdKey)
                return RandomImagesModels.Response.DataModel(data: data, imageId: imageId, isFavorite: false)
            }))
            group.leave()
        }
        group.notify(queue: .main) {
            let response = RandomImagesModels.Response(dataArray: self.loadedImages)
            self.presenter.presentData(response: response)
        }
    }
    
    func toggleImageStatus(request: RandomImagesFileWorkingModels.Request) {
        let isFavorite = loadedImages[request.imageId].isFavorite
        if !isFavorite {
            loadedImages[request.imageId].filePath = saveDataToFile(
                data: loadedImages[request.imageId].data,
                fileId: loadedImages[request.imageId].imageId
            )
            if let stringImageId = loadedImages[request.imageId].imageId,
               let intImageId = Int(stringImageId),
               let filePathURL = loadedImages[request.imageId].filePath {
                let imageModel = ImageModel(imageId: intImageId, filePath: filePathURL.absoluteString, isFavorite: !isFavorite)
                saveDataToDB(imageModel: imageModel)
            }
            if loadedImages[request.imageId].filePath != nil {
                loadedImages[request.imageId].isFavorite = !isFavorite
            }
        }
        presenter.presentToggledImageStatus(response: RandomImagesFileWorkingModels.Response(imageId: request.imageId, isFavorite: !isFavorite))
    }
}

// MARK: - Constants
extension RandomImagesInteractor {
    enum Constants {
        static let numberOfRequest: Int = 20
        static let uniqueImageIdKey: String = "picsum-id"
    }
}
