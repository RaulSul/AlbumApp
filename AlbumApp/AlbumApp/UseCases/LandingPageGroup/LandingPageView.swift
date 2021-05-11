//
//  LandinPgeView.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit
import SnapKit

class LandingPageView: UIView {

    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(collectionView)
        
        //MARK: - Layout
        
        collectionView.snp.remakeConstraints { make in
            make.top.equalTo(snp.top)
            make.trailing.equalTo(snp.trailing)
            make.leading.equalTo(snp.leading)
            make.bottom.equalTo(snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
