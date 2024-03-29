//
//  Project: ImageGalleryApp
//  File: FileManager.swift
//  Created by: Robert Bikmurzin
//  Date: 22.01.2024
//

import UIKit

protocol IFileWorker {
    func saveDataToFile(data: Data, fileName: String) -> URL
    func loadData(fileName: String) -> Data?
    func deleteFile(fileName: String)
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
    
    func loadData(fileName: String) -> Data? {
        let imagePath = getDocumentsDirectory().appendingPathComponent(fileName, conformingTo: .url)
        let data = try? Data(contentsOf: imagePath)
        return data
    }
    
    func deleteFile(fileName: String) {
        let imagePath = getDocumentsDirectory().appendingPathComponent(fileName, conformingTo: .url)
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(at: imagePath)
        } catch let error as NSError {
            print("Возникла ошибка при удалении файла: \(error)")
        }
    }
}
