//
//  Project: ImageGalleryApp
//  File: ImageTableViewCell.swift
//  Created by: Robert Bikmurzin
//  Date: 19.01.2024
//

import UIKit
import SnapKit

protocol ImageTableViewCellDelegate {
    func changeImageStatus(isFavorite: Bool)
}

final class ImageTableViewCell: UITableViewCell {
    
    private let image: UIImage
    
    private var isFavorite: Bool
    
    private let delegate: ImageTableViewCellDelegate
    
    private let imageCard: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let addFavoriteButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = Constants.heartImage
        button.addTarget(ImageTableViewCell.self, action: #selector(addFavoriteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(image: UIImage, isFavorite: Bool, delegate: ImageTableViewCellDelegate) {
        self.image = image
        self.isFavorite = isFavorite
        self.delegate = delegate
        super.init(frame: CGRect.zero)
        backgroundColor = Constants.backgroundColor
        configCell()
        setImage()
        isImageFavorite()
    }
    
    private func setImage() {
        imageCard.image = image
    }
    
    private func isImageFavorite() {
        guard isFavorite else { return }
        addFavoriteButton.imageView?.image = Constants.heartFillImage
    }
    
    private func configCell() {
        imageCard.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().offset(Constants.imageCardBottomPadding)
            make.top.equalToSuperview()
        }
        addFavoriteButton.snp.makeConstraints { make in
            make.centerY.equalTo(snp.bottom).offset(Constants.addFavoriteButtonCenterYPadding)
            make.left.equalToSuperview().offset(Constants.addFavoriteButtonLeftPadding)
        }
    }
    
    @objc
    private func addFavoriteButtonTapped() {
        print("addFavoriteButtonTapped")
        delegate.changeImageStatus(isFavorite: isFavorite)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constants
extension ImageTableViewCell {
    enum Constants {
        static let imageCardHorizontalPadding: CGFloat = 10
        static let imageCardBottomPadding: CGFloat = 30
        static let addFavoriteButtonLeftPadding: CGFloat = 10
        static let addFavoriteButtonCenterYPadding: CGFloat = 15
        static let heartImage: UIImage? = .init(systemName: "heart")?.withTintColor(.gray)
        static let heartFillImage: UIImage? = .init(systemName: "heart.fill")?.withTintColor(.red)
        static let backgroundColor: UIColor = .lightGray
    }
}
