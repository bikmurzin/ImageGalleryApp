//
//  Project: ImageGalleryApp
//  File: ImageTableViewCell.swift
//  Created by: Robert Bikmurzin
//  Date: 19.01.2024
//

import UIKit
import SnapKit

protocol ImageTableViewCellDelegate: AnyObject {
    func changeImageStatus(isFavorite: Bool, cell: UITableViewCell)
}

final class ImageTableViewCell: UITableViewCell {
    
    static let identifier = "imageTableViewCell"
    
    private var isFavorite: Bool = false
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCell()
        isImageFavorite()
    }
    
    func setImage(imageModel: ImageTableModels.ViewModel.ImageModel) {
        imageCard.image = imageModel.image
        self.isFavorite = imageModel.isFavorite
        isImageFavorite()
    }
    
    func favoriteChange(isFavorite: Bool) {
        self.isFavorite = isFavorite
        isImageFavorite()
    }
    
    private func isImageFavorite() {
        addFavoriteButton.setImage(isFavorite ? Constants.heartFillImage : Constants.heartImage, for: .normal)
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
        backgroundColor = Constants.backgroundColor
    }
    
    @objc
    private func addFavoriteButtonTapped() {
        delegate?.changeImageStatus(isFavorite: isFavorite, cell: self)
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
