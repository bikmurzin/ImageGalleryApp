//
//  Project: ImageGalleryApp
//  File: RandomImagesInteractorTests.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Quick
import Nimble
import Foundation

@testable import ImageGalleryApp

final class RandomImagesInteractorTests: QuickSpec {
    override class func spec() {
        var presenterMock: RandomImagesPresenterMock!
        var dataLoaderMock: DataLoaderMock!
        var fileWorkerMock: FileWorkerMock!
        var realmManagerMock: RealmManagerMock!
        var interactor: RandomImagesInteractor!
        
        beforeEach {
            presenterMock = RandomImagesPresenterMock()
            dataLoaderMock = DataLoaderMock()
            fileWorkerMock = FileWorkerMock()
            realmManagerMock = RealmManagerMock()
        }
        
        describe(".loadData") {
            it("should call loadData in dataLoader") {
                // given
                interactor = RandomImagesInteractor(presenter: presenterMock, dataLoader: dataLoaderMock, fileWorker: fileWorkerMock, realmManager: realmManagerMock)
                dataLoaderMock.loadedDataStub = []
                
                // when
                interactor.loadData()
                
                // then
                expect(dataLoaderMock.isLoadDataCalled).to(equal(1))
            }
            
            it("should call presentData in presenter") {
                // given
                interactor = RandomImagesInteractor(presenter: presenterMock, dataLoader: dataLoaderMock, fileWorker: fileWorkerMock, realmManager: realmManagerMock)
                dataLoaderMock.loadedDataStub = []
                
                // when
                interactor.loadData()
                
                // then
                waitUntil(timeout: NimbleTimeInterval.seconds(1)) { done in
                    expect(presenterMock.isPresentDataCalled).to(equal(1))
                    done()
                }
            }
        }
        
        describe(".toggleImageStatus") {
            it("should call presentToggledImageStatus in presenter") {
                // given
                interactor = RandomImagesInteractor(presenter: presenterMock, dataLoader: dataLoaderMock, fileWorker: fileWorkerMock, realmManager: realmManagerMock)
                let testRequest = RandomImagesFileWorkingModels.Request(imageId: Constants.testImageId)
                let testResponse = RandomImagesFileWorkingModels.Response(imageId: Constants.testImageId, isFavorite: Constants.testIsFavorite)
                
                // when
                interactor.toggleImageStatus(request: testRequest)
                
                // then
                expect(presenterMock.isPresentToggledImageStatusCalled).to(equal(1))
                expect(presenterMock.receiverRandomImagesFileWorkingModelsResponse).to(equal(testResponse))
            }
        }
    }
}

extension RandomImagesInteractorTests {
    enum Constants {
        static let testData: Data? = Data()
        static let testImageId: Int = 215
        static let testStringImageId: String = "215"
        static let testIsFavorite: Bool = false
        static let testUrlResponse: URLResponse? = URLResponse()
        static let uniqueImageIdKey: String = "picsum-id"
    }
}
