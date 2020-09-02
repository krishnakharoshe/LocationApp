//
//  LocationCellViewModelTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp

class LocationCellViewModelTests: XCTestCase {

    func testInit_LocationCellViewModel() {
       
        let expectedName = "Name: Italy"
        let expectedLatitude = "Latitude: 41.87194"
        let expectedLongitude = "Longitude: 12.56738"
       
        let cellViewModel = LocationCellViewModel(location: Location(name: "Italy", latitude: 41.87194, longitude: 12.56738))
        
        XCTAssertEqual(cellViewModel.name, expectedName)
        XCTAssertEqual(cellViewModel.lattitude, expectedLatitude)
        XCTAssertEqual(cellViewModel.longitude, expectedLongitude)
    }
}
