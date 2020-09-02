//
//  LocationViewModel.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationViewModel {

    //constants
    enum Constants {
        static let host = "wikipedia"
        static let path = "places"
        static let queryOne = "latitude"
        static let queryTwo = "longitude"
    }
    
    // url loading fails
    enum Failure: Error {
        case coordinates
        case wrongURL
    }

    // public variables
    var title = ""
    
    var dataSource: [Location] {
        return AppData.shared().getLocationArray()
    }
    
    var rowCount: Int{
        return dataSource.count
    }
    
    var handler: ((Bool, Failure) -> Void)?
    
    init() {
        title = "List Of Locations"
    }
    
    // instance methods
    
    func getLocationCellViewModel(for index: Int) -> LocationCellViewModel {
        return LocationCellViewModel(location: dataSource[index])
    }
    
    func openUrlFrom(location: Location, result: @escaping (Bool, Failure?) -> Void) {
                
        guard let latitude = location.latitude,
              let longitude = location.longitude else {
            result(false, .coordinates)
            return
        }
        
        let urlString = "\(Constants.host)://\(Constants.path)?\(Constants.queryOne)=\(latitude)&\(Constants.queryTwo)=\(longitude)"

        guard let appURL = URL(string: urlString) else {
            result(false, .wrongURL)
            return
        }
        
        if UIApplication.shared.canOpenURL(appURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL)
            }
            else {
                UIApplication.shared.openURL(appURL)
            }
            result(true, nil)
        } else {
            result(false, .wrongURL)
        }
    }
}
