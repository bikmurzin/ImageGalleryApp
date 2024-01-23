//
//  Project: ImageGalleryApp
//  File: FavoriteImagesView.swift
//  Created by: Robert Bikmurzin
//  Date: 23.01.2024
//

import UIKit
import SnapKit

protocol FavoriteImagesViewDelegate: AnyObject {
    func deleteFromFavorites(cellID: Int, isFavorite: Bool)
}

final class FavoriteImagesView: UIView {
    
    weak var delegate: FavoriteImagesViewDelegate?
    
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
    
    func addImageCard(viewModel: FavoriteImagesModels.ViewModel) {
        tableView.addImages(imageArray: viewModel)
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
extension FavoriteImagesView {
    enum Constants {
        static let backgroundColor: UIColor = .white
    }
}

// MARK: - IEndOfTableHandler
extension FavoriteImagesView: ImageTableViewDelegate {
    func changeImageStatus(cellID: Int, isFavorite: Bool) {
        delegate?.deleteFromFavorites(cellID: cellID, isFavorite: isFavorite)
    }
    
    func endOfTableReached() {
        
    }
}
