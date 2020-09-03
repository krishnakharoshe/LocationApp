//
//  LocationViewModelTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp

private class MockAppData: AppData {}

private class MockLocationViewController: LocationViewController {}

class LocationViewModelTests: XCTestCase {

    var viewModel: LocationViewModel?

    override func setUpWithError() throws {
        self.viewModel = LocationViewModel()
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
    }
    
    func testInit_LocationViewModel() {
        let expectedTitle = "List Of Locations"
        XCTAssertEqual(self.viewModel!.title,expectedTitle)
        XCTAssertEqual(self.viewModel!.dataSource, MockAppData.sharedData.getLocationArray())
    }
    
    func testWhenIndexPassed_ShouldGetTableCellModelView() {
        let expectedName = "Italy"
        let cellViewModel = self.viewModel!.getLocationCellViewModel(for: 1)
        XCTAssertEqual(cellViewModel.name, expectedName)
    }
    
    func testOpenUrlWithLocation_ShouldReturnTrue() {
        let location = Location(name: "India", latitude: 20.593684, longitude: 78.96288)
        let viewController = MockLocationViewController()
        self.viewModel!.open(location: location,
                             controller: viewController,
                             completionBlock: { result in
                                XCTAssertTrue(result)
                             })
    }
    
    func testOpenUrlWithWrongLocation_ShouldReturnFalse() {
        let location = Location(name: nil, latitude: nil, longitude: nil)
        let viewController = MockLocationViewController()
        self.viewModel!.open(location: location,
                             controller: viewController,
                             completionBlock: { result in
                                XCTAssertFalse(result)
                             })
    }
}
