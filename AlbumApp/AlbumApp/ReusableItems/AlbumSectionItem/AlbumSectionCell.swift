//
//  AlbumCectionCell.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import IGListKit
import UIKit
import SnapKit

class AlbumSectionCell: UICollectionViewCell {
    var modelObject: AlbumSectionControllerModel?
    
    lazy var albumImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        if let image: UIImage = UIImage(named: "placeholderImage") {
            imageView.image = image
        }
        return imageView
    }()
    
    lazy var albumTitleLabel: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.text = "< Album Title >"
        lbl.font = .systemFont(ofSize: 20)
        return lbl
    }()
    
    lazy var rightChevronImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        if let image: UIImage = UIImage(named: "rightChevron") {
            imageView.image = image
        }
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        
        contentView.addSubview(albumImageView)
        contentView.addSubview(albumTitleLabel)
        contentView.addSubview(rightChevronImageView)
        
        
        albumImageView.snp.remakeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(5)
            make.width.height.equalTo(24)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        rightChevronImageView.snp.remakeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(-5)
            make.width.height.equalTo(24)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        albumTitleLabel.snp.remakeConstraints { make in
            make.leading.equalTo(albumImageView.snp.trailing).offset(5)
            make.height.equalTo(24)
            make.trailing.equalTo(rightChevronImageView.snp.leading).offset(-5)
            make.centerY.equalTo(contentView.snp.centerY)
            
        }
    }

    required init?(coder _: NSCoder) { fatalError("init(coder:)") }

    override func prepareForReuse() {
        self.modelObject = nil
    }
}

extension AlbumSectionCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? AlbumSectionControllerModel else { fatalError() }
        self.modelObject = model
        self.backgroundColor = self.modelObject?.backgroundColor
    }
}
