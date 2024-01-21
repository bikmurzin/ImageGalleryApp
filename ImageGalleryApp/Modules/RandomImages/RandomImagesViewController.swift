//
//  Project: ImageGalleryApp
//  File: RandomImagesViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol RandomImagesDisplayLogic: AnyObject {
    func displayData(viewModel: RandomImagesModels.ViewModel)
}

final class RandomImagesViewController: UIViewController {
    
    private let interactor: RandomImagesBusinessLogic
    private let randomImagesView = RandomImagesView()
    
    init(interactor: RandomImagesBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .green
        self.view = randomImagesView
        interactor.loadData()
    }
}

extension RandomImagesViewController: RandomImagesDisplayLogic {
    func displayData(viewModel: RandomImagesModels.ViewModel) {
        var imageArray: [ImageTableViewCellModel] = viewModel.images.map { image in
            return ImageTableViewCellModel(image: image, url: nil, isFavorite: false)
        }
        randomImagesView.addImageCard(cellViewModel: imageArray)
    }
}
