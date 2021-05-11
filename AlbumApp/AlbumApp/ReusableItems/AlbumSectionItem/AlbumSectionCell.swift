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
    
    lazy var tappableView: UIView = {
        return UIView()
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        
        tappableView.isUserInteractionEnabled = true
        tappableView.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(tappableViewClicked)
        ))
        
        contentView.addSubview(tappableView)
        contentView.insertSubview(albumImageView, aboveSubview: tappableView)
        contentView.insertSubview(albumTitleLabel, aboveSubview: tappableView)
        contentView.insertSubview(rightChevronImageView, aboveSubview: tappableView)
        
        tappableView.snp.remakeConstraints { make in
            make.edges.equalTo(contentView.snp.edges)
        }
        
        albumImageView.snp.remakeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.width.height.equalTo(24)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        rightChevronImageView.snp.remakeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(-10)
            make.width.height.equalTo(12)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        albumTitleLabel.snp.remakeConstraints { make in
            make.leading.equalTo(albumImageView.snp.trailing).offset(10)
            make.height.equalTo(24)
            make.trailing.equalTo(rightChevronImageView.snp.leading).offset(-10)
            make.centerY.equalTo(contentView.snp.centerY)
            
        }
    }
    
    @objc func tappableViewClicked() {
        modelObject?.onClick?()
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
        self.albumImageView.image = modelObject?.thumbnail
        self.albumTitleLabel.text = modelObject?.albumTitle
    }
}
