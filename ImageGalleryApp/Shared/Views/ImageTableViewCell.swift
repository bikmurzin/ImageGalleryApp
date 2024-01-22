//
//  Project: ImageGalleryApp
//  File: ImageTableViewCell.swift
//  Created by: Robert Bikmurzin
//  Date: 19.01.2024
//

import UIKit
import SnapKit

protocol ImageTableViewCellDelegate: AnyObject {
    func changeImageStatus(isFavorite: Bool)
}

final class ImageTableViewCell: UITableViewCell {
    
    private let image: UIImage?
    
    private var isFavorite: Bool
    
    weak var delegate: ImageTableViewCellDelegate?
    
    private let imageCard: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let addFavoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.heartImage, for: .normal)
        button.addTarget(self, action: #selector(addFavoriteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(image: UIImage?, isFavorite: Bool) {
        self.image = image
        self.isFavorite = isFavorite
        super.init(style: .default, reuseIdentifier: "cell")
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
        addFavoriteButton.setImage(Constants.heartFillImage, for: .normal)
    }
    
    private func configCell() {
        addSubview(imageCard)
        contentView.addSubview(addFavoriteButton)
        imageCard.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview().inset(Constants.imageCardBottomPadding)
            make.top.equalToSuperview()
        }
        addFavoriteButton.snp.makeConstraints { make in
            make.bottom.equalTo(snp.bottom).inset(Constants.addFavoriteButtonCenterYPadding)
            make.left.equalToSuperview().inset(Constants.addFavoriteButtonLeftPadding)
            make.width.height.equalTo(Constants.addFavoriteButtonSize)
        }
    }
    
    @objc
    private func addFavoriteButtonTapped() {
        print("addFavoriteButtonTapped")
        isFavorite = !isFavorite
        addFavoriteButton.setImage(isFavorite ? Constants.heartFillImage : Constants.heartImage, for: .normal)
        delegate?.changeImageStatus(isFavorite: isFavorite)
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
        static let addFavoriteButtonSize: CGFloat = 30
        static let heartImage: UIImage? = .init(systemName: "heart")?.withTintColor(.gray)
        static let heartFillImage: UIImage? = .init(systemName: "heart.fill")?.withTintColor(.red)
        static let backgroundColor: UIColor = .clear
    }
}
