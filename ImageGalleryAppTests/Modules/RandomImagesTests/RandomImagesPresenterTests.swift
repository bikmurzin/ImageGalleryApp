//
//  Project: ImageGalleryApp
//  File: RandomImagesPresenterTests.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Quick
import Nimble
import UIKit

@testable import ImageGalleryApp


final class RandomImagesPresenterTests: QuickSpec {
    override class func spec() {
        var presenter: RandomImagesPresenter!
        var viewControllerMock: RandomImagesViewControllerMock!
        
        beforeEach {
            viewControllerMock = RandomImagesViewControllerMock()
            presenter = RandomImagesPresenter()
            presenter.viewController = viewControllerMock
        }
        
        describe(".presentData") {
            it("should call displayData in viewController") {
                // given
                let testResponse = RandomImagesModels.Response(dataArray: [])
                let testViewModel = RandomImagesModels.ViewModel(imageModels: [])
                
                // when
                presenter.presentData(response: testResponse)
                
                // then
                expect(viewControllerMock.isDisplayDataCalled).to(equal(1))
                expect(viewControllerMock.receivedViewModel).to(equal(testViewModel))
            }
        }
        
        describe(".presentToggledImageStatus") {
            it("should call displayUpdatedImageStatus in viewController") {
                // given
                let testResponse = RandomImagesFileWorkingModels.Response(imageId: Constants.testImageId, isFavorite: Constants.testIsFavorite)
                let testViewModel = RandomImagesFileWorkingModels.ViewModel(imageId: Constants.testImageId, isFavorite: Constants.testIsFavorite)
                
                // when
                presenter.presentToggledImageStatus(response: testResponse)
                
                // then
                expect(viewControllerMock.isDisplayUpdatedImageStatusCalled).to(equal(1))
                expect(viewControllerMock.receivedFileWorkingViewModel).to(equal(testViewModel))
            }
        }
    }
}

extension RandomImagesPresenterTests {
    enum Constants {
        static let testImageId: Int = 215
        static let testIsFavorite: Bool = false
    }
}
