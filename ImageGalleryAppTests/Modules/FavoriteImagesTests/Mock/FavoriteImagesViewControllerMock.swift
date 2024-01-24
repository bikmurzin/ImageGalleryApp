//
//  Project: ImageGalleryApp
//  File: FavoriteImagesViewControllerMock.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

@testable import ImageGalleryApp

final class FavoriteImagesViewControllerMock: FavoriteImagesDisplayLogic {
    
    private(set) var isDisplayDataCalled: Int = 0
    private(set) var receivedViewModel: FavoriteImagesModels.ViewModel!
    func displayData(viewModel: ImageGalleryApp.FavoriteImagesModels.ViewModel) {
        isDisplayDataCalled += 1
        receivedViewModel = viewModel
    }
}
