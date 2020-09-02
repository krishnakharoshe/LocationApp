//
//  LocationCellViewModel.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import Foundation

class LocationCellViewModel {
    
    private let locationObject: Location?
    
    var name: String? {
        guard let location = self.locationObject,
              let name = location.name else { return nil }
        return name
    }

    init(location: Location) {
        self.locationObject = location
    }
}
