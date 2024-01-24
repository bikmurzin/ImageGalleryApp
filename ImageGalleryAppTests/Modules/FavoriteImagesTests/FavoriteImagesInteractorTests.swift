//
//  Project: ImageGalleryApp
//  File: FavoriteImagesInteractorTests.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//


import Quick
import Nimble

@testable import ImageGalleryApp

final class FavoriteImagesInteractorTests: QuickSpec {
    override class func spec() {
        var presenterMock: FavoriteImagesPresenterMock!
        var fileWorkerMock: FileWorkerMock!
        var realmManagerMock: RealmManagerMock!
        var interactor: FavoriteImagesInteractor!
        
        beforeEach {
            presenterMock = FavoriteImagesPresenterMock()
            fileWorkerMock = FileWorkerMock()
            realmManagerMock = RealmManagerMock()
            interactor = FavoriteImagesInteractor(presenter: presenterMock, fileWorker: fileWorkerMock, realmManager: realmManagerMock)
        }
        
        describe(".loadData") {
            it("should call presentData in presenter") {
                // given
                let testResponse = FavoriteImagesModels.Response(dataArray: [])
                realmManagerMock.loadDataFromDBStub = []
                
                // when
                interactor.loadData()
                
                // then
                expect(presenterMock.isPresentDataCalled).to(equal(1))
                expect(presenterMock.receivedResponse).to(equal(testResponse))
            }
        }
        
        describe(".deleteFromFavorites") {
            it("should call presentData in presenter") {
                // given
                let testRequest = FavoriteImagesModels.Request(elementId: Constants.testImageId)
                let testResponse = FavoriteImagesModels.Response(dataArray: [])
                realmManagerMock.loadDataFromDBStub = []
                
                // when
                interactor.deleteFromFavorites(request: testRequest)
                
                // then
                expect(presenterMock.isPresentDataCalled).to(equal(1))
                expect(presenterMock.receivedResponse).to(equal(testResponse))
            }
        }
    }
}

extension FavoriteImagesInteractorTests {
    enum Constants {
        static let testImageId: Int = 215
        static let testIsFavorite: Bool = false
    }
}
