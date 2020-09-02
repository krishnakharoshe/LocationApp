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
       
        let expectedName = "Italy"
       
        let cellViewModel = LocationCellViewModel(location: Location(name: "Italy", latitude: 41.87194, longitude: 12.56738))
        
        XCTAssertEqual(cellViewModel.name, expectedName)

    }
}
