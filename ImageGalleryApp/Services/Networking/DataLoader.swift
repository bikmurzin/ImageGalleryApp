//
//  Project: ImageGalleryApp
//  File: ImageLoader.swift
//  Created by: Robert Bikmurzin
//  Date: 20.01.2024
//

import UIKit

protocol IDataLoader {
    func loadData() -> Data?
}

final class DataLoader {
    
}

// MARK: - IImageLoader
extension DataLoader: IDataLoader {
    func loadData() -> Data? {
        let group = DispatchGroup()
        let url = URL(string: "\(Constants.api)/\(Constants.imageWidth)/\(Constants.imageHeight)")
        var returnData: Data? = nil
        group.enter()
        let response = RequestManager.makeRequest(url: url) { result in
            switch result {
            case .success(let response):
                returnData = response.data
                let urlResponse = response.urlResponse
                group.leave()
            case .failure(let error):
                print(error)
                group.leave()
            }
        }
        group.wait()
        return(returnData)
    }
}

// MARK: - Constants
extension DataLoader {
    enum Constants {
        static let api = "https://picsum.photos/"
        static let imageWidth = "200"
        static let imageHeight = "300"
    }
}
