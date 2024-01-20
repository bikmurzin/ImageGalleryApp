//
//  Project: ImageGalleryApp
//  File: RequestManager.swift
//  Created by: Robert Bikmurzin
//  Date: 20.01.2024
//

import Foundation


enum NetworkError: Error {
    case urlError
    case canNotParseData
}

final class RequestManager {
    /// Совершает запрос по указанному URL и выполняет переданный completionHandler
    static func makeRequest(url: URL?,
                            completionHandler: @escaping (_ result: Result<(data: Data, urlResponse: URLResponse?), NetworkError>) -> Void
    ) {
        guard let url = url else {
            completionHandler(.failure(.urlError))
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse {
                completionHandler(.success((data, urlResponse)))
            } else {
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
