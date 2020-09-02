//
//  AddLocationViewModelTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp

class AddLocationViewModelTests: XCTestCase {

    var viewModel: AddLocationViewModel?
    override func setUpWithError() throws {
        self.viewModel = AddLocationViewModel()
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
    }
    
    func testInit_AddLocationViewModel() {
        
        guard let viewModel = self.viewModel else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(viewModel.namePlaceholder, "Enter location name")
        XCTAssertEqual(viewModel.latitudePlaceholder, "Enter latitude")
        XCTAssertEqual(viewModel.longitudePlaceholder, "Enter longitude")
        XCTAssertEqual(viewModel.buttonTitle, "Save")
        XCTAssertEqual(viewModel.title, "Add Location")
    }

    func testAddLocation_AppDataCountShouldBeFive() {
        
        guard let viewModel = self.viewModel else {
            XCTFail()
            return
        }
        
        let expectedLocation = Location(name: "ABC", latitude: 20.456767, longitude: 20.345678)

        viewModel.addLocation(name: "ABC", latitude: 20.456767, longitude: 20.345678)
        let lastAddedLocation = AppData.shared().getLocationArray().last
        XCTAssertEqual(lastAddedLocation, expectedLocation)
    }
}
