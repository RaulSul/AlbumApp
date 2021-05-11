//
//  AlbumSectionControllerModel.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import IGListKit

class AlbumSectionControllerModel: ListDiffable {
    let id: String
    var backgroundColor: UIColor
    var albumTitle: String
    var onClick: (() -> Void)?
    var thumbnail: UIImage

    init(
        id: String,
        albumTitle: String,
        backgroundColor: UIColor,
        thumbnail: UIImage,
        onClick: (() -> Void)?
    ) {
        self.id = id
        self.backgroundColor = backgroundColor
        self.onClick = onClick
        self.thumbnail = thumbnail
        self.albumTitle = albumTitle
    }

    func diffIdentifier() -> NSObjectProtocol {
        return self.id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? AlbumSectionControllerModel else { fatalError() }
        return self.id == object.id
            && self.backgroundColor == object.backgroundColor
            && self.albumTitle == albumTitle
    }
}
