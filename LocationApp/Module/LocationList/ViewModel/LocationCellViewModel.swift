//
//  LocationCellViewModel.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import Foundation

class LocationCellViewModel {
    
    private let locationObject: Location
    
    var name: String? {
        guard let name = self.locationObject.name else { return nil }
        return "Name: \(name)"
    }
    
    var lattitude: String? {
        guard let lattitude = self.locationObject.latitude else { return nil }
        return "Latitude: \(lattitude)"
    }
    
    var longitude: String? {
        guard let longitude = self.locationObject.longitude else { return nil }
        return "Longitude: \(longitude)"
    }
    
    init(location: Location) {
        self.locationObject = location
    }
}
