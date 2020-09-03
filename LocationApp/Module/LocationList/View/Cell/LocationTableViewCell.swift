//
//  LocationTableViewCell.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: - Instance function
    func prepareCellFrom(viewModel: LocationCellViewModel) {
        self.nameLabel.text = viewModel.name
    }
}
