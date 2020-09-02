//
//  AddLocationViewModel.swift
//  LocationApp
//
//  Created by krishna kharoshe on 01/09/20.
//

import UIKit

class AddLocationViewModel: NSObject {

    //constants
    enum Constants {
        static let namePlaceholder = "Enter location name"
        static let latitudePlaceholder = "Enter latitude"
        static let longitudePlaceholder = "Enter longitude"
        static let buttonTitle = "Save"
        static let title = "Add Location"
    }
    
    var title: String {
        return Constants.title
    }
    
    var namePlaceholder: String {
        return Constants.namePlaceholder
    }
    
    var latitudePlaceholder: String {
        return Constants.latitudePlaceholder
    }
    
    var longitudePlaceholder: String {
        return Constants.longitudePlaceholder
    }
    
    var buttonTitle: String {
        return Constants.buttonTitle
    }
    
    func addLocation(name: String, latitude: Double, longitude: Double) {
        AppData.shared().addLocation(location: Location(name: name, latitude: latitude, longitude: longitude))
    }
}
