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
    
    enum Result<T> {
        case success(T)
        case failure(Alert)
    }
    
    enum Alert: Error {
        case coordinates
        case wrongURL
    }
    
    enum Action {
        case reload
    }

    private let sharedInstance = AppData.shared()

    // public variables
    var title = ""
    
    var dataSource: [Location] {
        return sharedInstance.getLocationArray()
    }
    
    var rowCount: Int{
        return dataSource.count
    }
    
    typealias handler = (Result<Bool>) -> ()
    var action: ((Action) ->())?
    
    init() {
        title = "List Of Locations"
    }
    
    // instance methods
    func getLocationCellViewModel(for index: Int) -> LocationCellViewModel {
        return LocationCellViewModel(location: dataSource[index])
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
    
    func reloadTableViewIfRequired() {
        if sharedInstance.isDataUpdated {
            self.action?(.reload)
            sharedInstance.isDataUpdated = false
        }
    }
}
