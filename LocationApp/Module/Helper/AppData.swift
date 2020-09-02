//
//  AppData.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class AppData {

    private static var sharedData = AppData()
    
    private var locationsArray = [Location]()
    
    private init() {
        
        self.locationsArray = [
            Location(name: "India", latitude: 20.593684, longitude: 78.96288),
            Location(name: "Italy", latitude: 41.87194, longitude: 12.56738),
            Location(name: "Lithuania", latitude: 55.169438, longitude: 23.881275),
            Location(name: "Madagascar", latitude: -18.766947, longitude: 46.869107)
        ]
    }
    
    class func shared() -> AppData {
        return sharedData
    }
    
    func getLocationArray() -> [Location] {
        return self.locationsArray
    }
    
    func addLocation(location: Location) {
        self.locationsArray.append(location)
    }
}
