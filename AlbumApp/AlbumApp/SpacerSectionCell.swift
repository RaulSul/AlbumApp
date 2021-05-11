//
//  SpacerSectionCell.swift
//  AlbumApp
//
//  Created by Raul Sulaimanov on 11.05.21.
//

import Foundation
import IGListKit
import UIKit

class SpacerSectionCell: UICollectionViewCell {
    var modelObject: SpacerSectionControllerModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
    }

    required init?(coder _: NSCoder) { fatalError("init(coder:)") }

    override func prepareForReuse() {
        self.modelObject = nil
    }
}

extension SpacerSectionCell: ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let model = viewModel as? SpacerSectionControllerModel else { fatalError() }
        self.modelObject = model
        self.backgroundColor = self.modelObject?.backgroundColor
    }
}
