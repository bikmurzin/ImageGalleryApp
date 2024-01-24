//
//  Project: ImageGalleryApp
//  File: FileWorkerMock.swift
//  Created by: Robert Bikmurzin
//  Date: 24.01.2024
//

import Foundation
@testable import ImageGalleryApp

final class FileWorkerMock: IFileWorker {
    
    private(set) var isSaveDataToFileCalled: Int = 0
    private(set) var fileUrlStub: URL!
    func saveDataToFile(data: Data, fileName: String) -> URL {
        isSaveDataToFileCalled += 1
        return fileUrlStub
    }
    
    private(set) var isLoadDataCalled: Int = 0
    private(set) var loadedDataStub: Data!
    func loadData(fileName: String) -> Data? {
        isLoadDataCalled += 1
        return loadedDataStub
    }
    
    private(set) var isDeleteFileCalled: Int = 0
    func deleteFile(fileName: String) {
        isDeleteFileCalled += 1
    }
}
