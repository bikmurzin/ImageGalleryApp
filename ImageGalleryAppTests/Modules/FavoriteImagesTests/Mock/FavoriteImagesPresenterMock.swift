//
//  Project: ImageGalleryApp
//  File: FavoriteImagesPresenterMock.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

@testable import ImageGalleryApp

final class FavoriteImagesPresenterMock: FavoriteImagesPresentationLogic {
    
    private(set) var isPresentDataCalled: Int = 0
    private(set) var receivedResponse: FavoriteImagesModels.Response!
    func presentData(response: ImageGalleryApp.FavoriteImagesModels.Response) {
        isPresentDataCalled += 1
        receivedResponse = response
    }
}
