//
//  Project: ImageGalleryApp
//  File: ImageLoader.swift
//  Created by: Robert Bikmurzin
//  Date: 20.01.2024
//

import UIKit

protocol IDataLoader {
    func loadData(numberOfRequests: Int) -> [(data: Data?, urlResponse: URLResponse?)]
}

final class DataLoader {
    
}

// MARK: - IDataLoader
extension DataLoader: IDataLoader {
    func loadData(numberOfRequests: Int) -> [(data: Data?, urlResponse: URLResponse?)] {
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "addElementsToArray")
        let url = URL(string: "\(Constants.api)/\(Constants.imageWidth)/\(Constants.imageHeight)\(Constants.fileEnding)")
        var returnData: [(data: Data?, urlResponse: URLResponse?)] = []
        for _ in 0..<numberOfRequests {
            group.enter()
            let response = RequestManager.makeRequest(url: url) { result in
                switch result {
                case .success(let response):
                    queue.async {
                        returnData.append((response.data, response.urlResponse))
                        group.leave()
                    }
                    let urlResponse = response.urlResponse
                    
                case .failure(let error):
                    print(error)
                    group.leave()
                }
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
        static let fileEnding = ".jpg"
    }
}
