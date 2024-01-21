//
//  Project: ImageGalleryApp
//  File: RandomImagesPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol RandomImagesPresentationLogic: AnyObject {
    func presentData(response: RandomImagesModels.Response)
}

final class RandomImagesPresenter {
    
    weak var viewController: RandomImagesDisplayLogic?
}

extension RandomImagesPresenter: RandomImagesPresentationLogic {
    func presentData(response: RandomImagesModels.Response) {
        var imageArray: [UIImage?] = response.map { data in
            guard let data = data else {return nil}
            return UIImage(data: data)
        }
        let viewModel = RandomImagesModels.ViewModel(images: imageArray)
        viewController?.displayData(viewModel: viewModel)
    }
}
