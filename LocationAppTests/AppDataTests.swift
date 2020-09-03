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
        self.appData = MockAppData.sharedData
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
    
    func testWhenURLOpen_ShouldReturnTrueInResult() {
        
        self.appData?.openUrlFrom(location: Location(name: "India",
                                                    latitude: 20.593684,
                                                    longitude: 78.96288),
                                 result: { result in
                                    
                                    switch (result) {
                                    case .success(let flag):
                                        XCTAssertTrue(flag)
                                        break
                                    case .failure(_):
                                        XCTFail()
                                        break
                                        
                                    }
                                 })
    }
    
    func testWhenLocationIsNil_ShouldReturnCoordinatesWrong() {
        
        self.appData?.openUrlFrom(location: Location(name: "India", latitude: nil, longitude: nil),
                                  result: { result in
                                    switch (result) {
                                    case .success(let flag):
                                        XCTAssertFalse(flag)
                                        break
                                    case .failure(let error):
                                        XCTAssertEqual(error, .coordinates)
                                        break
                                    }
                                    
                                  })
    }
}
