//
//  Project: ImageGalleryApp
//  File: RealmManager.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Foundation
import RealmSwift

protocol IRealmManager {
    func saveDataToDB(model: ImageModel)
    func loadDataFromDB() -> [ImageModel]
    func deleteDataFromDB(imageId: Int)
    func isObjectExists(imageId: Int) -> Bool
}

final class RealmManager {
    
    private let realm = try? Realm()
}

// MARK: - IRealmManager
extension RealmManager: IRealmManager {
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
    
    func deleteDataFromDB(imageId: Int) {
        guard let realm = realm else { return }
        do {
            try realm.write {
                let objects = realm.objects(ImageDBModel.self).where {
                    $0.imageId == imageId
                }
                realm.delete(objects)
            }
        } catch let error as NSError {
            print("Ошибка при удалении из БД: \(error)")
        }
    }
    
    func isObjectExists(imageId: Int) -> Bool {
        guard let realm = realm else { return false }
        var isObjectExists = false
        do {
            try realm.write {
                let objects = realm.objects(ImageDBModel.self).where {
                    $0.imageId == imageId
                }
                isObjectExists = !objects.isEmpty
            }
        } catch let error as NSError {
            print("Ошибка при поиске объекта: \(error)")
        }
        return isObjectExists
    }
}
