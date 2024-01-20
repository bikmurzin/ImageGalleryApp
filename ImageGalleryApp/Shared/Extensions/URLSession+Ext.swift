//
//  Project: ImageGalleryApp
//  File: URLSession.swift
//  Created by: Robert Bikmurzin
//  Date: 20.01.2024
//

import Foundation

extension URLResponse {
    func headerField(forKey key: String) -> String? {
        (self as? HTTPURLResponse)?.allHeaderFields[key] as? String
    }
}
