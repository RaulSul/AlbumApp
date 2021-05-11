//
//  PhotoViewController.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit
import SnapKit

class PhotoViewController: UIViewController {
    
    var TAG: String = "[PhotoVC]"
    var photoURL: URL
    var photoTitle: String

    lazy var rootView: PhotoView = {
        let view: PhotoView = PhotoView()
        
        return view
    }()
    
    init(photoURL: URL, photoTitle: String) {
        self.photoURL = photoURL
        self.photoTitle = photoTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.rootView)
        
        rootView.headerView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        rootView.photoImageView.downloaded(from: photoURL)
        rootView.headerView.photoTitleLabel.text = photoTitle
        
        //MARK: - Layout
        self.rootView.snp.remakeConstraints { make in
            make.edges.equalTo(self.view.snp.edges)
        }
        
        print(TAG + " >>> has been loaded...")
    }
    
    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
