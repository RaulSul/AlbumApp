//
//  PhotoView.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit

class PhotoView: UIView {
    
    var imageURL: [(URL, URL)] = []
    
    lazy var headerView: PhotoHeaderView = {
        return PhotoHeaderView()
    }()
    
    lazy var photoImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        if let image: UIImage = UIImage(named: "placeholderImage") {
            imageView.image = image
        }
        
        return imageView
    }()
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .black
        
        addSubview(headerView)
        addSubview(photoImageView)
        
        //MARK: - Layout
        
        headerView.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.top.equalTo(snp.top)
            make.trailing.equalTo(snp.trailing)
            
            switch UIApplication.shared.doesDeviceHasTopNotch() {
            case true:
                make.height.equalTo(42 + UIApplication.shared.getStatusBarYOffset())
            case false:
                make.height.equalTo(42)
            }
        }
        
        photoImageView.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.top.equalTo(headerView.snp.bottom)
            make.bottom.equalTo(snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
