//
//  Project: ImageGalleryApp
//  File: DBModels.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Foundation
import RealmSwift

final class ImageDBModel: Object {
    @objc dynamic var imageId: Int = 0
    @objc dynamic var filePath: URL = URL(fileURLWithPath: "")
    @objc dynamic var isFavorite: Bool = true
}

struct ImageModel: Equatable {
    let imageId: Int
    let filePath: URL
    let isFavorite: Bool
}
