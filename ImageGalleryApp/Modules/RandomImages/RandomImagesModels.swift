//
//  Project: ImageGalleryApp
//  File: RandomImagesModels.swift
//  Created by: Robert Bikmurzin
//  Date: 21.01.2024
//

import Foundation
import UIKit

enum RandomImagesModels {
    
    struct Response: Equatable {
        var dataArray: [DataModel]
        
        struct DataModel: Equatable {
            let data: Data?
            let imageId: String?
            var isFavorite: Bool
            var filePath: URL?
        }
    }
    
    typealias ViewModel = ImageTableModels.ViewModel
}

enum RandomImagesFileWorkingModels {
    
    struct Request: Equatable {
        let imageId: Int
    }
    
    struct Response: Equatable {
        let imageId: Int
        let isFavorite: Bool
    }
    
    typealias ViewModel = ImageTableModels.ViewResponse
}
