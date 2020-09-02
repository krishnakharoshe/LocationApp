//
//  AddLocationViewControllerTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp
class AddLocationViewControllerTests: XCTestCase {

    var controller: AddLocationViewController?

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.controller = storyboard.instantiateViewController(identifier: "AddLocationViewController") as AddLocationViewController
        let _ = self.controller?.view
    }

    override func tearDownWithError() throws {
        self.controller = nil
    }
    
    func testInit_ShouldReturnNotNilController() {
        let controller = AddLocationViewController.instantiate()
        XCTAssertTrue(controller.isKind(of: AddLocationViewController.self))
    }
    
    func test_LocationNameTextFieldNotNilAfterViewDidLoad() {
        XCTAssertNotNil(self.controller?.locationNameTextfield)
    }
    
    func test_LatitudeTextFieldNotNilAfterViewDidLoad() {
        XCTAssertNotNil(self.controller?.latitudeTextfield)
    }

    func test_LongitudeTextFieldNotNilAfterViewDidLoad() {
        XCTAssertNotNil(self.controller?.longitudeTextfield)
    }

    func test_SaveButtonNotNilAfterViewDidLoad() {
        XCTAssertNotNil(self.controller?.saveButton)
    }
}
