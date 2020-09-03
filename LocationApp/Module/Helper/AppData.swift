//
//  AppData.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class AppData {

    // MARK: - Constant
    enum Constants {
        static let host = "wikipedia"
        static let path = "places"
        static let queryOne = "latitude"
        static let queryTwo = "longitude"
    }
    
    enum Result<T> {
        case success(T)
        case failure(Alert)
    }
    
    enum Alert: Error {
        case coordinates
        case wrongURL
    }
    
    enum Message {
        case invalid
        case wrongDetails
    }
    
    // private variables
    static var sharedData = AppData()
    private var locationsArray = [Location]()
    
    //public variables
    typealias handler = (Result<Bool>) -> ()
    
    private init() {
        
        self.locationsArray = [
            Location(name: "India", latitude: 20.593684, longitude: 78.96288),
            Location(name: "Italy", latitude: 41.87194, longitude: 12.56738),
            Location(name: "Lithuania", latitude: 55.169438, longitude: 23.881275),
            Location(name: "Madagascar", latitude: -18.766947, longitude: 46.869107)
        ]
    }
    
    func getLocationArray() -> [Location] {
        return self.locationsArray
    }
    
    func openUrlFrom(location: Location, result: @escaping handler) {
        guard let latitude = location.latitude,
              let longitude = location.longitude else {
            result(.failure(.coordinates))
            return
        }

        let urlString = "\(Constants.host)://\(Constants.path)?\(Constants.queryOne)=\(latitude)&\(Constants.queryTwo)=\(longitude)"

        guard let appURL = URL(string: urlString) else {
            result(.failure(.wrongURL))
            return
        }

        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL)
            result(.success(true))
        } else {
            result(.failure(.wrongURL))
        }
    }
}
