//
//  UICollectionView+Helpers.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import UIKit
import IGListKit

extension UICollectionView {
    static func sectionControllerForObject(
        modelObject: Any,
        workingRangeDelegate: ListWorkingRangeDelegate? = nil
    ) -> ListSectionController {
        if modelObject is SpacerSectionControllerModel {
            return SpacerSectionController()
        } else if modelObject is AlbumSectionControllerModel {
            return AlbumSectionController()
        }
        
        
        
        fatalError("can't find a matching section controller for the provided model")
    }
}
