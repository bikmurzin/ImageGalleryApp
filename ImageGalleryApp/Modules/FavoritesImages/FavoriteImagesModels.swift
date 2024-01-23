//
//  Project: ImageGalleryApp
//  File: FavoriteImagesModels.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Foundation

enum FavoriteImagesModels {
    
    struct Request: Equatable {
        let elementId: Int
    }
    
    struct Response: Equatable {
        var dataArray: [DataModel]

        struct DataModel: Equatable {
            let data: Data?
            let imageId: String
            var isFavorite: Bool
            var filePath: URL?
        }
    }
    
    typealias ViewModel = ImageTableModels.ViewModel
}
