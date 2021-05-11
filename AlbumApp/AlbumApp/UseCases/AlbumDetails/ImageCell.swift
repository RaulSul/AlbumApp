//
//  CollectionViewCell.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit
import SnapKit

class ImageCell: UICollectionViewCell {
    
    var imageURL: URL?
    var photoTitle: String?
    
    lazy var albumImageView: UIImageView = {
        let imgView: UIImageView = UIImageView()
        if let image: UIImage = UIImage(named: "placeholderImage") {
            imgView.image = image
        }
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(albumImageView)
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
        
        albumImageView.snp.remakeConstraints { make in
            make.edges.equalTo(contentView.snp.edges)
        }
        
    }
    
    func setUpCellWithThumbnailImage(with thumnailUrl: URL) {
        albumImageView.downloaded(from: thumnailUrl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
