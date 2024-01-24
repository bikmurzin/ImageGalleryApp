//
//  Project: ImageGalleryApp
//  File: FavoriteImagesPresenterTests.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

import Quick
import Nimble
import UIKit

@testable import ImageGalleryApp


final class FavoriteImagesPresenterTests: QuickSpec {
    override class func spec() {
        var presenter: FavoriteImagesPresenter!
        var viewControllerMock: FavoriteImagesViewControllerMock!
        
        beforeEach {
            viewControllerMock = FavoriteImagesViewControllerMock()
            presenter = FavoriteImagesPresenter()
            presenter.viewController = viewControllerMock
        }
        
        describe(".presentData") {
            it("should call displayData in viewController") {
                // given
                let testResponse = FavoriteImagesModels.Response(dataArray: [])
                let testViewModel = RandomImagesModels.ViewModel(imageModels: [])
                
               // when
                presenter.presentData(response: testResponse)
                
                // then
                expect(viewControllerMock.isDisplayDataCalled).to(equal(1))
                expect(viewControllerMock.receivedViewModel).to(equal(testViewModel))
            }
        }
    }
}

extension FavoriteImagesPresenterTests {
    enum Constants {
        static let testImageId: Int = 215
        static let testIsFavorite: Bool = false
    }
}
