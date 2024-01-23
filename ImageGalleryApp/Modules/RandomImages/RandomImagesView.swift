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
    func updateImageStatus(cellID: Int, isFavorite: Bool)
}

final class RandomImagesView: UIView {
    
    weak var delegate: RandomImagesViewDelegate?
    
    private let tableView: ImageTableView = {
        let tableView = ImageTableView()
        tableView.backgroundColor = .clear
        return tableView
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
    
    private func configView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        tableView.imageTableViewDelegate = self
        backgroundColor = Constants.backgroundColor
    }
}

// MARK: - Constants
extension RandomImagesView {
    enum Constants {
        static let backgroundColor: UIColor = .white
    }
}

// MARK: - IEndOfTableHandler
extension RandomImagesView: ImageTableViewDelegate {
    func changeImageStatus(cellID: Int, isFavorite: Bool) {
        delegate?.updateImageStatus(cellID: cellID, isFavorite: isFavorite)
    }
    
    func endOfTableReached() {
        delegate?.getMoreImages()
    }
}
