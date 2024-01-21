//
//  Project: ImageGalleryApp
//  File: RandomImagesModels.swift
//  Created by: Robert Bikmurzin
//  Date: 21.01.2024
//

import Foundation
import UIKit

enum RandomImagesModels {
    typealias Response = [Data?]
    
    struct ViewModel {
        let images: [UIImage?]
    }
}
