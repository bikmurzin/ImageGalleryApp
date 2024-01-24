//
//  Project: ImageGalleryApp
//  File: FavoriteImagesInteractorMock.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

@testable import ImageGalleryApp

final class FavoriteImagesInteractorMock: FavoriteImagesBusinessLogic {
    
    private(set) var isLoadDataCalled: Int = 0
    func loadData() {
        isLoadDataCalled += 1
    }
    
    private(set) var isDeleteFromFavoritesCalled: Int = 0
    private(set) var receivedRequest: FavoriteImagesModels.Request!
    func deleteFromFavorites(request: ImageGalleryApp.FavoriteImagesModels.Request) {
        isDeleteFromFavoritesCalled += 1
        receivedRequest = request
    }
}
