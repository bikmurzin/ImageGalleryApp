//
//  Project: ImageGalleryApp
//  File: ViewControllerMock.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

@testable import ImageGalleryApp

final class RandomImagesViewControllerMock: RandomImagesDisplayLogic {
    
    private(set) var isDisplayDataCalled: Int = 0
    private(set) var receivedViewModel: ImageGalleryApp.RandomImagesModels.ViewModel!
    func displayData(viewModel: ImageGalleryApp.RandomImagesModels.ViewModel) {
        isDisplayDataCalled += 1
        receivedViewModel = viewModel
    }
    
    private(set) var isDisplayUpdatedImageStatusCalled: Int = 0
    private(set) var receivedFileWorkingViewModel: RandomImagesFileWorkingModels.ViewModel!
    func displayUpdatedImageStatus(viewModel: ImageGalleryApp.RandomImagesFileWorkingModels.ViewModel) {
        isDisplayUpdatedImageStatusCalled += 1
        receivedFileWorkingViewModel = viewModel
    }
}
