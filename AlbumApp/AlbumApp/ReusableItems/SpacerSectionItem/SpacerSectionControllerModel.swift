//
//  SpacerSectionControllerModel.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import IGListKit

class SpacerSectionControllerModel: ListDiffable {
    let id: String
    var backgroundColor: UIColor

    init(
        id: String,
        backgroundColor: UIColor
    ) {
        self.id = id
        self.backgroundColor = backgroundColor
    }

    func diffIdentifier() -> NSObjectProtocol {
        return self.id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? SpacerSectionControllerModel else { fatalError() }
        return self.id == object.id
            && self.backgroundColor == object.backgroundColor
    }
}
