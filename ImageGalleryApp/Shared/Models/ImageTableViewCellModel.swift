//
//  Project: ImageGalleryApp
//  File: ImageTableViewCellModel.swift
//  Created by: Robert Bikmurzin
//  Date: 19.01.2024
//

import UIKit

struct ImageTableViewCellModel: Equatable {
    let image: UIImage?
    let url: URL?
    let isFavorite: Bool
}
