//
//  LocationTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp

class LocationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInit_ShouldOnlyTakeName() {
        let location = Location(name: "India", latitude: nil, longitude: nil)
        XCTAssertEqual(location.name, "India")
        XCTAssertNil(location.latitude)
        XCTAssertNil(location.longitude)
    }
    
    func testInit_ShouldOnlyTakeLatitude() {
        let location = Location(name: nil, latitude: 20.593684, longitude: nil)
        XCTAssertNil(location.name)
        XCTAssertEqual(location.latitude, 20.593684)
        XCTAssertNil(location.longitude)
    }

    func testInit_ShouldOnlyTakeLongtitude() {
        let location = Location(name: nil, latitude: nil, longitude: 78.96288)
        XCTAssertNil(location.name)
        XCTAssertNil(location.latitude)
        XCTAssertEqual(location.longitude,78.96288)
    }
    
    func testInit_ShouldTakeNameAndLatitudeAndLongitude() {
        let location = Location(name: "India", latitude: 20.593684, longitude: 78.96288)
        XCTAssertEqual(location.name, "India")
        XCTAssertEqual(location.latitude, 20.593684)
        XCTAssertEqual(location.longitude, 78.96288)
    }
    
    func testEqualLocation_ShouldBeEqual() {
        let firstLocation = Location(name: "India", latitude: 20.593684, longitude: 78.96288)
        let secondLocation = Location(name: "India", latitude: 20.593684, longitude: 78.96288)
        XCTAssertEqual(firstLocation, secondLocation)
    }
    
    func testWhenNameDifferent_ShouldNotBeEqual() {
        let firstLocation = Location(name: "India", latitude: 20.593684, longitude: 78.96288)
        let secondLocation = Location(name: "London", latitude: 20.593684, longitude: 78.96288)
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
    
    func testWhenLatitudeDifferent_ShouldNotBeEqual() {
        let firstLocation = Location(name: "India", latitude: 20.593684, longitude: 78.96288)
        let secondLocation = Location(name: "London", latitude: 40.593684, longitude: 78.96288)
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
    
    func testWhenLongitudeDifferent_ShouldNotBeEqual() {
        let firstLocation = Location(name: "India", latitude: 20.593684, longitude: 78.96288)
        let secondLocation = Location(name: "London", latitude: 40.593684, longitude: 100.96288)
        XCTAssertNotEqual(firstLocation, secondLocation)
    }
}
