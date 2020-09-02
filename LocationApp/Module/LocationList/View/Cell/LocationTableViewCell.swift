//
//  LocationTableViewCell.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    
    func prepareCellFrom(viewModel: LocationCellViewModel) {
        self.nameLabel.text = viewModel.name
    }
}
