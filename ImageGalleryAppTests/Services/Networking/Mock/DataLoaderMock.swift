//
//  Project: ImageGalleryApp
//  File: DataLoaderMock.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

import Foundation
@testable import ImageGalleryApp

final class DataLoaderMock: IDataLoader {
    
    private(set) var isLoadDataCalled: Int = 0
    var loadedDataStub: [(data: Data?, urlResponse: URLResponse?)]!
    func loadData(numberOfRequests: Int) -> [(data: Data?, urlResponse: URLResponse?)] {
        isLoadDataCalled += 1
        return loadedDataStub
    }
}
