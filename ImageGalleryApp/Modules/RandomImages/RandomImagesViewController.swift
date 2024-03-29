//
//  Project: ImageGalleryApp
//  File: RandomImagesViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 18.01.2024
//

import UIKit

protocol RandomImagesDisplayLogic: AnyObject {
    func displayData(viewModel: RandomImagesModels.ViewModel)
    func displayUpdatedImageStatus(viewModel: RandomImagesFileWorkingModels.ViewModel)
}

final class RandomImagesViewController: UIViewController {
    
    private let interactor: RandomImagesBusinessLogic
    private lazy var randomImagesView = RandomImagesView()
    
    init(interactor: RandomImagesBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = randomImagesView
        randomImagesView.startLoading()
        randomImagesView.delegate = self
        interactor.loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        randomImagesView.startLoading()
        interactor.checkFavoriteImages()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        randomImagesView.stopLoading()
    }
}

// MARK: - RandomImagesDisplayLogic
extension RandomImagesViewController: RandomImagesDisplayLogic {
    
    func displayData(viewModel: RandomImagesModels.ViewModel) {
        randomImagesView.addImageCard(viewModel: viewModel)
        randomImagesView.stopLoading()
    }
    
    func displayUpdatedImageStatus(viewModel: RandomImagesFileWorkingModels.ViewModel) {
        randomImagesView.toggleImageCardStatus(viewModel: viewModel)
        randomImagesView.stopLoading()
    }
}

// MARK: - RandomImagesViewDelegate
extension RandomImagesViewController: RandomImagesViewDelegate {
    func updateImageStatus(cellID: Int) {
        interactor.toggleImageStatus(request: RandomImagesFileWorkingModels.Request(imageId: cellID))
    }
    
    func getMoreImages() {
        interactor.loadData()
        randomImagesView.startLoading()
    }
}
