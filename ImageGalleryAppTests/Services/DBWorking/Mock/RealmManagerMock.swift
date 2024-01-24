//
//  Project: ImageGalleryApp
//  File: RealmManagerMock.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

@testable import ImageGalleryApp

final class RealmManagerMock: IRealmManager {
    
    private(set) var receivedImageModel: ImageModel!
    private(set) var isSaveToDBCalled: Int = 0
    func saveDataToDB(model: ImageGalleryApp.ImageModel) {
        isSaveToDBCalled += 1
        receivedImageModel = model
    }
    
    var loadDataFromDBStub: [ImageGalleryApp.ImageModel]!
    private(set) var isLoadDataFromDBCalled: Int = 0
    func loadDataFromDB() -> [ImageGalleryApp.ImageModel] {
        isLoadDataFromDBCalled += 1
        return loadDataFromDBStub
    }
    
    private(set) var isDeleteDataFromDBCalled: Int = 0
    func deleteDataFromDB(imageId: Int) {
        isDeleteDataFromDBCalled += 1
    }
    
    var isObjectExistsStub: Bool!
    private(set) var isIsObjectExistsCalled: Int = 0
    func isObjectExists(imageId: Int) -> Bool {
        isIsObjectExistsCalled += 1
        return isObjectExistsStub
    }
}
