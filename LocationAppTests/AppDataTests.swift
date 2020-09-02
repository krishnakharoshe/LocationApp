//
//  AppDataTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp

private class MockAppData: AppData {}

class AppDataTests: XCTestCase {

    var appData: AppData?
    override func setUpWithError() throws {
        self.appData = AppData.shared()
    }

    override func tearDownWithError() throws {
        self.appData = nil
    }

    func testInit_ShouldNotBeNil() {
        XCTAssertNotNil(self.appData)
    }
    
    func testLocationData_ShouldNotBeNil() {
        XCTAssertNotNil(self.appData?.getLocationArray())
    }
}
