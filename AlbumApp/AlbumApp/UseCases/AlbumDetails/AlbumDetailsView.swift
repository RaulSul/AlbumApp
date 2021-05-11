//
//  AlbumDetailsView.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit

class AlbumDetailsView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var images: [URL] = []
    
    
    lazy var headerView: AlbumDetailsHeaderView = {
        return AlbumDetailsHeaderView()
    }()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "imageCell")
        collectionView.backgroundColor = .purple
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var number = images.count
        
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
        
        if !(images.isEmpty) {
            cell.setUpCellWithImage(url: images[indexPath.item])
        }
        
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
