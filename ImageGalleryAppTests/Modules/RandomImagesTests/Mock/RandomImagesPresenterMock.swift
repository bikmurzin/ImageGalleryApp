//
//  Project: ImageGalleryApp
//  File: RandomImagesPresenterMock.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

@testable import ImageGalleryApp

final class RandomImagesPresenterMock: RandomImagesPresentationLogic {
    
    private (set) var isPresentDataCalled: Int = 0
    private (set) var receivedRandomImagesModelsResponse: ImageGalleryApp.RandomImagesModels.Response!
    func presentData(response: ImageGalleryApp.RandomImagesModels.Response) {
        isPresentDataCalled += 1
        receivedRandomImagesModelsResponse = response
    }
    
    private (set) var isPresentToggledImageStatusCalled: Int = 0
    private (set) var receiverRandomImagesFileWorkingModelsResponse : RandomImagesFileWorkingModels.Response!
    func presentToggledImageStatus(response: ImageGalleryApp.RandomImagesFileWorkingModels.Response) {
        isPresentToggledImageStatusCalled += 1
        receiverRandomImagesFileWorkingModelsResponse = response
    }
}
