//
//  Project: ImageGalleryApp
//  File: RandomImagesViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol RandomImagesDisplayLogic: AnyObject {
    func displayData(viewModel: RandomImagesModels.ViewModel)
    func updateImageStatus(viewModel: RandomImagesFileWorkingModels.ViewModel)
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
        randomImagesView.delegate = self
        interactor.loadData()
    }
}

// MARK: - RandomImagesDisplayLogic
extension RandomImagesViewController: RandomImagesDisplayLogic {
    
    func displayData(viewModel: RandomImagesModels.ViewModel) {
        randomImagesView.addImageCard(viewModel: viewModel)
    }
    
    func updateImageStatus(viewModel: RandomImagesFileWorkingModels.ViewModel) {
        randomImagesView.toggleImageCardStatus(viewModel: viewModel)
    }
}

// MARK: - RandomImagesViewDelegate
extension RandomImagesViewController: RandomImagesViewDelegate {
    func updateImageStatus(cellID: Int, isFavorite: Bool) {
        interactor.toggleImageStatus(request: RandomImagesFileWorkingModels.Request(imageId: cellID))
    }
    
    func getMoreImages() {
        interactor.loadData()
    }
}
