//
//  Project: ImageGalleryApp
//  File: ImageTableView.swift
//  Created by: Robert Bikmurzin
//  Date: 19.01.2024
//

import UIKit

protocol IEndOfTableHandler: AnyObject {
    func endOfTableReached()
}

final class ImageTableView: UITableView {
    weak var endOfTableDelegate: IEndOfTableHandler?
    private (set) var imageArray: [ImageTableViewCellModel] = []
    
    init(imageArray: [ImageTableViewCellModel]) {
        self.imageArray = imageArray
        super.init(frame: CGRectZero, style: UITableView.Style.plain)
        delegate = self
        dataSource = self
        backgroundColor = Constants.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addImages(imageArray: [ImageTableViewCellModel]) {
        self.imageArray.append(contentsOf: imageArray)
        reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ImageTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = imageArray[indexPath.row]
        let cell = ImageTableViewCell(image: cellModel.image, isFavorite: cellModel.isFavorite)
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
        if indexPath.row + 1 == imageArray.count {
            endOfTableDelegate?.endOfTableReached()
        }
    }
}

// MARK: - ImageTableViewCellDelegate
extension ImageTableView: ImageTableViewCellDelegate {
    
    func changeImageStatus(isFavorite: Bool) {
        // TODO: - Call ImageTableViewDelegate
    }
}

// MARK: - Constants
extension ImageTableView {
    enum Constants {
        static let tableViewCellHeight: CGFloat = 300
        static let backgroundColor: UIColor = .clear
    }
}
