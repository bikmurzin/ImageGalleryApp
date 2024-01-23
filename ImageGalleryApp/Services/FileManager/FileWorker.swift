//
//  Project: ImageGalleryApp
//  File: FileManager.swift
//  Created by: Robert Bikmurzin
//  Date: 22.01.2024
//

import UIKit

protocol IFileWorker {
    func saveDataToFile(data: Data, fileName: String) -> URL
    func loadData(fileURL: URL) -> Data?
}

final class FileWorker {
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

// MARK: - IFileWorker
extension FileWorker: IFileWorker {
    
    func saveDataToFile(data: Data, fileName: String) -> URL {
        let filePath = getDocumentsDirectory().appendingPathComponent(fileName)
        print(filePath)
        try? data.write(to: filePath)
        return filePath
    }
    
    func loadData(fileURL: URL) -> Data? {
        let data = try? Data(contentsOf: fileURL)
        return data
    }
}