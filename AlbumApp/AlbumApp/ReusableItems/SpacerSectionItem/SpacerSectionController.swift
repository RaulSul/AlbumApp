//
//  SpacerSectionController.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import IGListKit

class SpacerSectionController: ListSectionController {
    var item: SpacerSectionControllerModel?

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: SpacerSectionCell.self, for: self, at: index) as? SpacerSectionCell else { fatalError() }
        cell.bindViewModel(self.item!)
        return cell
    }

    override func sizeForItem(at _: Int) -> CGSize {
        return CGSize(
            width: self.collectionContext!.containerSize.width,
            height: 12
        )
    }

    override func didUpdate(to object: Any) {
        guard let updatedModelObject = object as? SpacerSectionControllerModel else { fatalError() }
        self.item = updatedModelObject
    }
}
