//
//  Project: ImageGalleryApp
//  File: RandomImagesInteractorMock.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

@testable import ImageGalleryApp

final class RandomImagesInteractorMock: RandomImagesBusinessLogic {
    
    private (set) var isLoadDataCalled: Int = 0
    func loadData() {
        isLoadDataCalled += 1
    }
    
    private (set) var isToggleImageStatusCalled: Int = 0
    private (set) var receivedFileWorkingModelsRequest: RandomImagesFileWorkingModels.Request!
    func toggleImageStatus(request: ImageGalleryApp.RandomImagesFileWorkingModels.Request) {
        isToggleImageStatusCalled += 1
        receivedFileWorkingModelsRequest = request
    }
    
    private (set) var isCheckFavoriteImagesCalled: Int = 0
    func checkFavoriteImages() {
        isCheckFavoriteImagesCalled += 1
        
    }
}
