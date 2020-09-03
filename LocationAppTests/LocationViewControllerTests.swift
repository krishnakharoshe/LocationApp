//
//  LocationViewControllerTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp

class LocationViewControllerTests: XCTestCase {

    var controller: LocationViewController?
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.controller = storyboard.instantiateViewController(identifier: "LocationViewController") as LocationViewController
        let _ = self.controller?.view
    }

    override func tearDownWithError() throws {
        self.controller = nil
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(self.controller?.tableView)
    }
    
    func testViewDidLoad_ShouldSetTableViewDataSource() {
        XCTAssertNotNil(self.controller?.tableView.dataSource)
        XCTAssertTrue(self.controller?.tableView.dataSource is LocationViewController)
    }
    
    func testViewDidLoad_ShouldSetTableViewDelegate() {
        XCTAssertNotNil(self.controller?.tableView.delegate)
        XCTAssertTrue(self.controller?.tableView.delegate is LocationViewController)
    }
    
    func testViewDidLoad_ShouldSetDelegateAndDataSourceToTheSameObject() {
        XCTAssertEqual(self.controller?.tableView.dataSource as? LocationViewController,
                       self.controller?.tableView.delegate as? LocationViewController)
    }
}
