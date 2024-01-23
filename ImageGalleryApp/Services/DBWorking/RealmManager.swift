//
//  Project: ImageGalleryApp
//  File: RealmManager.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Foundation
import RealmSwift

final class RealmManager {
    
    private let realm = try? Realm()
    
    func saveDataToDB(model: ImageModel) {
        guard let realm = realm else { return }
        let dbObject = ImageDBModel(value: ["imageId": model.imageId, "filePath": model.filePath, "isFavorite": model.isFavorite])
        do {
            try realm.write({
                realm.add(dbObject)
                print(Realm.Configuration.defaultConfiguration.fileURL!)
            })
        } catch let error as NSError {
            print("Something went wrong: \(error)")
        }
    }
    
    func loadDataFromDB() -> [ImageModel] {
        guard let realm = realm else { return [] }
        let dbItems = realm.objects(ImageDBModel.self)
        let imageModels: [ImageModel] = dbItems.map { result in
            print("result.filePath: \(result.filePath)")
            return ImageModel(imageId: result.imageId, filePath: result.filePath, isFavorite: result.isFavorite)
        }
        return imageModels
    }
}
