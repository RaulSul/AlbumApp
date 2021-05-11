//
//  AlbumSectionController.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import IGListKit

class AlbumSectionController: ListSectionController {
    var item: AlbumSectionControllerModel?

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = self.collectionContext?.dequeueReusableCell(of: AlbumSectionCell.self, for: self, at: index) as? AlbumSectionCell else { fatalError() }
        cell.bindViewModel(self.item!)
        return cell
    }

    override func sizeForItem(at _: Int) -> CGSize {
        return CGSize(
            width: self.collectionContext!.containerSize.width,
            height: 24
        )
    }

    override func didUpdate(to object: Any) {
        guard let updatedModelObject = object as? AlbumSectionControllerModel else { fatalError() }
        self.item = updatedModelObject
    }
}
