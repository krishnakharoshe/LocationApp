//
//  Location.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import Foundation

struct Location: Equatable {
    var name: String?
    var latitude: Double?
    var longitude: Double?
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        if lhs.name != rhs.name {
            return false
        }
        
        if lhs.latitude != rhs.latitude {
            return false
        }
        
        if lhs.longitude != rhs.longitude {
            return false
        }
        return true
    }
}
