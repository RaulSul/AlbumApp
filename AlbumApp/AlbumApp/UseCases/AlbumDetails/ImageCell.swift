//
//  CollectionViewCell.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit
import SnapKit

class ImageCell: UICollectionViewCell {
    
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
        
        albumImageView.snp.remakeConstraints { make in
            make.edges.equalTo(contentView.snp.edges)
        }
        
    }
    
    func setUpCellWithImage(url: URL) {
        albumImageView.downloaded(from: url)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
