//
//  Project: ImageGalleryApp
//  File: ImageTableModels.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import UIKit

struct ImageTableModels {
    struct ViewModel: Equatable {
        var imageModels: [ImageModel]
        
        struct ImageModel: Equatable {
            let image: UIImage?
            var isFavorite: Bool
        }
    }
    
    struct ViewResponse: Equatable {
        let imageId: Int
        let isFavorite: Bool
    }
}
