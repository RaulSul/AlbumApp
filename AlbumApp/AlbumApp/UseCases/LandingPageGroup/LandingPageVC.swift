//
//  ViewController.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import UIKit
import IGListKit
import SnapKit

class LandingPageVC: UIViewController {
    
    var TAG: String = "[LandingPageVC]"
    
    var listItems = [ListDiffable]()
    var adapter: ListAdapter?

    lazy var rootView: LandingPageView = {
        let view: LandingPageView = LandingPageView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(self.rootView)
        
        //MARK: IGListKitAdapter
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater, viewController: self)
        adapter.collectionView = self.rootView.collectionView
        adapter.dataSource = self
        self.adapter = adapter
        
        self.invalidate()
        
        //MARK: - Layout
        self.rootView.snp.remakeConstraints { make in
            make.edges.equalTo(self.view.snp.edges)
        }
    }

//MARK: - Invalidation Procedures
    func invalidate() {
        self.listItems = []
        
        self.listItems.append(
            SpacerSectionControllerModel(
                id: "top_spacer",
                backgroundColor: .cyan
            )
        )
        var count: Int = 0
        
        for item in 0...3 {
            self.listItems.append(
                AlbumSectionControllerModel(
                    id: "album_section_\(count)",
                    backgroundColor: .lightGray,
                    thumbnail: UIImage(named: "placeholderImage")!,
                    onClick: {
                        print("album_section_\(count) has been tapped")
//                        self.present(AlbumDetailsVC(), animated: true)
                        self.navigationController?.pushViewController(AlbumDetailsVC(), animated: true)
                    }
                )
            )
            
            self.listItems.append(
                SpacerSectionControllerModel(
                    id: "album_spacer_\(count)",
                    backgroundColor: .cyan
                )
            )
            
            count += 1
        }
        
        DispatchQueue.main.async {
            self.adapter?.performUpdates(animated: true, completion: nil)
            print(self.TAG + " >>> Invalidated...")
        }
    }
    
}


extension LandingPageVC: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.listItems
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return UICollectionView.sectionControllerForObject(modelObject: object)
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

