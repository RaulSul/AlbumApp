//
//  LandinPgeView.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit
import SnapKit

class LandingPageView: UIView {

    lazy var headerView: LandingPageHeaderView = {
        return LandingPageHeaderView()
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .lightGray
        collectionView.alwaysBounceVertical = true
        
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(headerView)
        addSubview(collectionView)
        
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
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.trailing.equalTo(snp.trailing)
            make.leading.equalTo(snp.leading)
            make.bottom.equalTo(snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
