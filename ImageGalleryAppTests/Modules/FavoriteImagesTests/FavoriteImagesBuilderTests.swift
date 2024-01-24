//
//  Project: ImageGalleryApp
//  File: FavoriteImagesBuilderTests.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Quick
import Nimble
import UIKit

@testable import ImageGalleryApp


final class FavoriteImagesBuilderTests: QuickSpec {
    override class func spec() {
        var favoriteImagesBuilder: FavoriteImagesBuilder!
        var result: UIViewController!
        
        beforeEach {
            favoriteImagesBuilder = FavoriteImagesBuilder()
            result = UIViewController()
        }
        
        describe(".build") {
            it("should return a valid UIViewController") {
                // when
                result = favoriteImagesBuilder.build()
                
                // then
                expect(result).to(beAKindOf(FavoriteImagesViewController.self))
            }
        }
    }
}
