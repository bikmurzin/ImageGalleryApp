//
//  Project: ImageGalleryApp
//  File: RandomImagesViewControllerTests.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Quick
import Nimble
import UIKit

@testable import ImageGalleryApp


final class RandomImagesViewControllerTests: QuickSpec {
    override class func spec() {
        var viewController: RandomImagesViewController!
        var interactorMock: RandomImagesInteractorMock!
        
        beforeEach {
            interactorMock = RandomImagesInteractorMock()
            viewController = RandomImagesViewController(interactor: interactorMock)
        }
        
        describe(".viewDidLoad") {
            context("when view is loaded") {
                it("should call loadData in interactor") {
                    // when
                    viewController.viewDidLoad()
                    
                    // then
                    expect(interactorMock.isLoadDataCalled).to(equal(1))
                }
            }
        }
        
        describe("viewDidAppear") {
            context("when view is loaded") {
                it("should call checkFavoriteImages in interactor") {
                    // when
                    viewController.viewDidAppear(true)
                    
                    // then
                    expect(interactorMock.isCheckFavoriteImagesCalled).to(equal(1))
                }
            }
        }
        
        describe(".updateImageStatus") {
            it("should call toggleImageStatus in interactor") {
                // given
                let testCellId = RandomImagesFileWorkingModels.Request(imageId: Constants.testImageId)
                
                // when
                viewController.updateImageStatus(cellID: Constants.testImageId)
                
                // then
                expect(interactorMock.isToggleImageStatusCalled).to(equal(1))
                expect(interactorMock.receivedFileWorkingModelsRequest).to(equal(testCellId))
            }
        }
        
        describe(".getMoreImages") {
            it("should call loadData in interactor") {
                // when
                viewController.getMoreImages()
                
                // then
                expect(interactorMock.isLoadDataCalled).to(equal(1))
            }
        }
        
        
    }
}

extension RandomImagesViewControllerTests {
    enum Constants {
        static let testImageId = 215
    }
}
