//
//  Project: ImageGalleryApp
//  File: RandomImagesBuilderTests.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import Quick
import Nimble
import UIKit

@testable import ImageGalleryApp


final class RandomImagesBuilderTests: QuickSpec {
    override class func spec() {
        var randomImagesBuilder: RandomImagesBuilder!
        var result: UIViewController!
        
        beforeEach {
            randomImagesBuilder = RandomImagesBuilder()
            result = UIViewController()
        }
        
        describe(".build") {
            it("should return a valid UIViewCOntroller") {
                // when
                result = randomImagesBuilder.build()
                
                // then
                expect(result).to(beAKindOf(RandomImagesViewController.self))
            }
        }
    }
}
