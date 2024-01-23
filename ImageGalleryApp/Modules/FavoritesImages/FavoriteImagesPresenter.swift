//
//  Project: ImageGalleryApp
//  File: FavoriteImagesPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol FavoriteImagesPresentationLogic: AnyObject {
    func presentData(response: FavoriteImagesModels.Response)
}

final class FavoriteImagesPresenter {
    
    weak var viewController: FavoriteImagesDisplayLogic?
}

extension FavoriteImagesPresenter: FavoriteImagesPresentationLogic {
    
    func presentData(response: FavoriteImagesModels.Response) {
        let imageModels: [FavoriteImagesModels.ViewModel.ImageModel] = response.dataArray.compactMap { dataModel in
            return FavoriteImagesModels.ViewModel.ImageModel(image: UIImage(data: dataModel.data ?? Data()), isFavorite: dataModel.isFavorite)
        }
        let viewModel = RandomImagesModels.ViewModel(imageModels: imageModels)
        viewController?.displayData(viewModel: viewModel)
    }
}
