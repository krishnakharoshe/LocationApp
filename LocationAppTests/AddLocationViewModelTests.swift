//
//  AddLocationViewModelTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp

class MockAddLocationViewController: AddLocationViewController {}

class AddLocationViewModelTests: XCTestCase {

    var viewModel: AddLocationViewModel?
    var mockController: MockAddLocationViewController?
    
    override func setUpWithError() throws {
        self.viewModel = AddLocationViewModel()
        self.mockController = MockAddLocationViewController()
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
        self.mockController = nil
    }
    
    func testInit_AddLocationViewModel() {
        
        XCTAssertEqual(viewModel!.namePlaceholder, "Enter location name (optional)")
        XCTAssertEqual(viewModel!.latitudePlaceholder, "Enter latitude")
        XCTAssertEqual(viewModel!.longitudePlaceholder, "Enter longitude")
        XCTAssertEqual(viewModel!.buttonTitle, "Open")
        XCTAssertEqual(viewModel!.title, "Add Location")
        XCTAssertEqual(viewModel!.errorMessage, "Enter correct details")
    }
    
    func testOpenUrlWithLocation_ShouldReturnTrue() {
        self.viewModel!.saveAndOpen(name: "India",
                                    latitude: 20.593684,
                                    longitude: 78.96288,
                                    controller: self.mockController!,
                                    completionBlock: { result in
                                        XCTAssertTrue(result)
                                    })
    }
    
    func testOpenUrlWithWrongLocation_ShouldReturnFalse() {
        self.viewModel!.saveAndOpen(name: "India",
                                    latitude: 20.593684,
                                    longitude: 78.96288,
                                    controller: self.mockController!,
                                    completionBlock: { result in
                                        XCTAssertTrue(result)
                                    })

    }
}
