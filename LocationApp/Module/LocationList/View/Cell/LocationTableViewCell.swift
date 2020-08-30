//
//  LocationTableViewCell.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lattitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
        
    func prepareCellFrom(viewModel: LocationCellViewModel) {
        self.nameLabel.text = viewModel.name
        self.lattitudeLabel.text = viewModel.lattitude
        self.longitudeLabel.text = viewModel.longitude
    }
}
