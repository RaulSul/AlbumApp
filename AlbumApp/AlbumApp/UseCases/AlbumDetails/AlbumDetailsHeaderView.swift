//
//  AlbumDetailsHeaderView.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit
import SnapKit

class AlbumDetailsHeaderView: UIView {
    
    lazy var backButton: UIButton = {
        let btt: UIButton = UIButton()
        if let image: UIImage = UIImage(named: "leftChevron") {
            btt.setImage(image, for: .normal)
        }
        
        return btt
    }()
    
    lazy var albumTitleLabel: UILabel = {
        let lbl: UILabel = UILabel()
        lbl.text = "< Album Title >"
        lbl.font = .systemFont(ofSize: 24)
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 0.88, green: 0.62, blue: 0.49, alpha: 1.00)
        return lbl
    }()

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.19, green: 0.09, blue: 0.28, alpha: 1.00)
        
        addSubview(backButton)
        addSubview(albumTitleLabel)
        
        backButton.snp.remakeConstraints { make in
            make.leading.equalTo(snp.leading).offset(24)
            make.height.width.equalTo(24)
            make.centerY.equalTo(snp.centerY).offset(12)
        }
        
        albumTitleLabel.snp.remakeConstraints { make in
            make.leading.equalTo(backButton.snp.trailing).offset(48)
            make.height.equalTo(48)
            make.trailing.equalTo(snp.trailing).offset(-72)
            make.centerY.equalTo(snp.centerY).offset(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
