//
//  AlbumDetailsVC.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit
import SnapKit

class AlbumDetailsVC: UIViewController {
    
    var TAG: String = "[AlbumDetailsVC]"
    var viewModel: AlbumDetailsViewModel

    lazy var rootView: AlbumDetailsView = {
        let view: AlbumDetailsView = AlbumDetailsView()
        
        return view
    }()
    
    init(viewModel: AlbumDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.rootView)
        
        viewModel.downloadJson { _ in
            self.rootView.images = self.viewModel.albumPhotoURLs
            self.rootView.collectionView.reloadData()
        }
        
        rootView.headerView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        
        rootView.headerView.albumTitleLabel.text = viewModel.albumTitle
        
        //MARK: - Layout
        self.rootView.snp.remakeConstraints { make in
            make.edges.equalTo(self.view.snp.edges)
        }
    }
    
    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
