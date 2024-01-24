//
//  Project: ImageGalleryApp
//  File: FavoriteImagesViewControllerTests.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//


import Quick
import Nimble
import UIKit

@testable import ImageGalleryApp

final class FavoriteImagesViewControllerTests: QuickSpec {
    override class func spec() {
        var viewController: FavoriteImagesViewController!
        var interactorMock: FavoriteImagesInteractorMock!
        
        beforeEach {
            interactorMock = FavoriteImagesInteractorMock()
            viewController = FavoriteImagesViewController(interactor: interactorMock)
        }
        
        describe(".viewDidLoad") {
            it("should call loadData in interactor") {
                // when
                viewController.viewDidLoad()
                
                // then
                expect(interactorMock.isLoadDataCalled).to(equal(1))
            }
        }
        
        describe(".viewDidAppear") {
            it("should call loadData in interactor") {
                // when
                viewController.viewDidAppear(true)
                
                // then
                expect(interactorMock.isLoadDataCalled).to(equal(1))
            }
        }
        
        describe(".deleteFromFavorites") {
            it("should call deleteFromFavorites in interactor") {
                // given
                let testRequest = FavoriteImagesModels.Request(elementId: Constants.testCellID)
                
                // when
                viewController.deleteFromFavorites(cellID: Constants.testCellID, isFavorite: Constants.testIsFavorite)
                
                // then
                expect(interactorMock.isDeleteFromFavoritesCalled).to(equal(1))
                expect(interactorMock.receivedRequest).to(equal(testRequest))
            }
        }
        
        
    }
}

extension FavoriteImagesViewControllerTests {
    enum Constants {
        static let testCellID: Int = 215
        static let testIsFavorite: Bool = false
    }
}
