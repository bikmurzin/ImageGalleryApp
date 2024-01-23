//
//  Project: ImageGalleryApp
//  File: ImageTableView.swift
//  Created by: Robert Bikmurzin
//  Date: 19.01.2024
//

import UIKit

protocol ImageTableViewDelegate: AnyObject {
    func endOfTableReached()
    func changeImageStatus(cellID: Int, isFavorite: Bool)
}

final class ImageTableView: UITableView {
    weak var imageTableViewDelegate: ImageTableViewDelegate?
    private (set) var imageArray = RandomImagesModels.ViewModel(imageModels: [])
    
    init() {
        super.init(frame: CGRectZero, style: UITableView.Style.plain)
        delegate = self
        dataSource = self
        backgroundColor = Constants.backgroundColor
        self.registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addImages(imageArray: RandomImagesModels.ViewModel) {
        self.imageArray = imageArray
        reloadData()
    }
    
    func toggleImageCardStatus(viewModel: RandomImagesFileWorkingModels.ViewModel) {
        imageArray.imageModels[viewModel.imageId].isFavorite = viewModel.isFavorite
        let indexPath = IndexPath(row: viewModel.imageId, section: 0)
        let cell = cellForRow(at: indexPath) as? ImageTableViewCell
        cell?.favoriteChange(isFavorite: viewModel.isFavorite)
    }
    
    private func registerCells() {
        register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
    }
}

// MARK: - UITableViewDataSource
extension ImageTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageArray.imageModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageModel = imageArray.imageModels[indexPath.row]
        guard let cell = dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as? ImageTableViewCell else {
            return UITableViewCell()
        }
        cell.setImage(imageModel: imageModel)
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ImageTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.tableViewCellHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == imageArray.imageModels.count {
            imageTableViewDelegate?.endOfTableReached()
        }
    }
}

// MARK: - ImageTableViewCellDelegate
extension ImageTableView: ImageTableViewCellDelegate {
    
    func changeImageStatus(isFavorite: Bool, cell: UITableViewCell) {
        guard let indexPath = indexPath(for: cell) else { return }
        imageTableViewDelegate?.changeImageStatus(cellID: indexPath.row, isFavorite: isFavorite)
    }
}

// MARK: - Constants
extension ImageTableView {
    enum Constants {
        static let tableViewCellHeight: CGFloat = 300
        static let backgroundColor: UIColor = .clear
    }
}
