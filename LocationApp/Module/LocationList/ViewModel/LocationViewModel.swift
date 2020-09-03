//
//  LocationViewModel.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationViewModel {

    enum Action {
        case reload
    }

    // MARK: - Private variable
    private let sharedInstance = AppData.sharedData

    // MARK: - Public variable
    var title = ""
    
    var dataSource: [Location] {
        return sharedInstance.getLocationArray()
    }
    
    var rowCount: Int{
        return dataSource.count
    }
    
    var action: ((Action) ->())?
    
    var router: LocationListRouter?
    
    init() {
        title = "List Of Locations"
    }
    
    // MARK: - Instance methods
    func getLocationCellViewModel(for index: Int) -> LocationCellViewModel {
        return LocationCellViewModel(location: dataSource[index])
    }
    
    // MARK: - Instance methods
    func open(location: Location, controller: UIViewController, completionBlock: ((Bool) -> ())? = nil) {
        self.sharedInstance.openUrlFrom(location: location,
                                        result: { [weak self] result in
                                            
                                            guard let self = self else { return }
                                            switch (result) {
                                            case .success(let flag):
                                                completionBlock?(flag)
                                            case .failure(.coordinates), .failure(.wrongURL):
                                                
                                                guard let router = self.router else { return }
                                                router.route(to: .alert,
                                                             from: controller,
                                                             with: nil)
                                                completionBlock?(false)
                                                break
                                            }})
        
    }
}
