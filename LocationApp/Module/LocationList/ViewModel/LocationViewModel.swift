//
//  LocationViewModel.swift
//  LocationApp
//
//  Created by krishna kharoshe on 29/08/20.
//

import UIKit

class LocationViewModel {

    var rowCount = 0
    var title = ""
    var dataSource = [Location]()
    
    init() {
        title = "List Of Locations"
        dataSource = AppData.sharedData.getLocationArray()
        rowCount = dataSource.count
    }
    
    func getLocationCellViewModel(for index: Int) -> LocationCellViewModel {
        return LocationCellViewModel(location: dataSource[index])
    }
}
