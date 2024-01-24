//
//  Project: ImageGalleryApp
//  File: RandomImagesPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol RandomImagesPresentationLogic: AnyObject {
    func presentData(response: RandomImagesModels.Response)
    func presentToggledImageStatus(response: RandomImagesFileWorkingModels.Response)
}

final class RandomImagesPresenter {
    
    weak var viewController: RandomImagesDisplayLogic?
}

extension RandomImagesPresenter: RandomImagesPresentationLogic {
    
    func presentData(response: RandomImagesModels.Response) {
        let imageModels: [RandomImagesModels.ViewModel.ImageModel] = response.dataArray.compactMap { dataModel in
            return RandomImagesModels.ViewModel.ImageModel(image: UIImage(data: dataModel.data ?? Data()), isFavorite: dataModel.isFavorite)
        }
        let viewModel = RandomImagesModels.ViewModel(imageModels: imageModels)
        viewController?.displayData(viewModel: viewModel)
    }
    
    func presentToggledImageStatus(response: RandomImagesFileWorkingModels.Response) {
        viewController?.displayUpdatedImageStatus(viewModel: RandomImagesFileWorkingModels.ViewModel(imageId: response.imageId, isFavorite: response.isFavorite))
    }
}
