//
//  AppData.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class AppData {

    static let sharedData = AppData()
    private var locationsArray = [Location]()
    
    func getLocationArray() -> [Location] {
        
        self.locationsArray = [
            Location(name: "India", lattitude: 20.593684, longitude: 78.96288),
            Location(name: "Italy", lattitude: 41.87194, longitude: 12.56738),
            Location(name: "Lithuania", lattitude: 55.169438, longitude: 23.881275),
            Location(name: "Madagascar", lattitude: -18.766947, longitude: 46.869107)
        ]
        return self.locationsArray
    }
}
