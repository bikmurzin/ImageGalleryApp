//
//  Project: ImageGalleryApp
//  File: RandomImagesView.swift
//  Created by: Robert Bikmurzin
//  Date: 21.01.2024
//

import UIKit
import SnapKit

protocol RandomImagesViewDelegate: AnyObject {
    func getMoreImages()
    func updateImageStatus(cellID: Int)
}

final class RandomImagesView: UIView {
    
    weak var delegate: RandomImagesViewDelegate?
    
    private let tableView: ImageTableView = {
        let tableView = ImageTableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        activityIndicator.color = Constants.activityIndicatorColor
        return activityIndicator
    }()
    
    init() {
        super.init(frame: CGRectZero)
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addImageCard(viewModel: RandomImagesModels.ViewModel) {
        tableView.addImages(imageArray: viewModel)
    }
    
    func toggleImageCardStatus(viewModel: RandomImagesFileWorkingModels.ViewModel) {
        tableView.toggleImageCardStatus(viewModel: viewModel)
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    private func configView() {
        addSubview(tableView)
        addSubview(activityIndicator)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        tableView.imageTableViewDelegate = self
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        backgroundColor = Constants.backgroundColor
    }
}

// MARK: - Constants
extension RandomImagesView {
    enum Constants {
        static let backgroundColor: UIColor = .white
        static let activityIndicatorColor: UIColor = .blue
    }
}

// MARK: - IEndOfTableHandler
extension RandomImagesView: ImageTableViewDelegate {
    func changeImageStatus(cellID: Int, isFavorite: Bool) {
        delegate?.updateImageStatus(cellID: cellID)
    }
    
    func endOfTableReached() {
        delegate?.getMoreImages()
    }
}
