//
//  Project: ImageGalleryApp
//  File: RandomImagesView.swift
//  Created by: Robert Bikmurzin
//  Date: 21.01.2024
//

import UIKit
import SnapKit

protocol IRandomImagesView: AnyObject {
    func getMoreImages()
}

final class RandomImagesView: UIView {
    
    weak var delegate: IRandomImagesView?
    
    private let tableView: ImageTableView = {
        let tableView = ImageTableView(imageArray: [])
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
    
    func addImageCard(cellViewModel: [ImageTableViewCellModel]) {
        tableView.addImages(imageArray: cellViewModel)
    }
    
    private func configView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        tableView.endOfTableDelegate = self
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
extension RandomImagesView: IEndOfTableHandler {
    func endOfTableReached() {
        delegate?.getMoreImages()
    }
}
