//
//  LocationViewModelTests.swift
//  LocationAppTests
//
//  Created by krishna kharoshe on 02/09/20.
//

import XCTest
@testable import LocationApp

class LocationViewModelTests: XCTestCase {

    var viewModel: LocationViewModel?

    override func setUpWithError() throws {
        self.viewModel = LocationViewModel()
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
    }
    
    func testInit_LocationViewModel() {
        
        guard let viewModel = self.viewModel else {
            XCTFail()
            return
        }
    
        let expectedDataSource = [
            Location(name: "India", latitude: 20.593684, longitude: 78.96288),
            Location(name: "Italy", latitude: 41.87194, longitude: 12.56738),
            Location(name: "Lithuania", latitude: 55.169438, longitude: 23.881275),
            Location(name: "Madagascar", latitude: -18.766947, longitude: 46.869107)
        ]
        let expectedTitle = "List Of Locations"
        
        XCTAssertEqual(viewModel.title,expectedTitle)
        XCTAssertEqual(viewModel.dataSource, expectedDataSource)
    }
    
    func testWhenIndexPassed_ShouldGetTableCellModelView() {
        
        guard let viewModel = self.viewModel else {
            XCTFail()
            return
        }
        
        let expectedName = "Italy"
        
        let cellViewModel = viewModel.getLocationCellViewModel(for: 1)
        
        XCTAssertEqual(cellViewModel.name, expectedName)
    }
    
    func testWhenURLOpen_ShouldReturnTrueInResult() {
        guard let viewModel = self.viewModel else {
            XCTFail()
            return
        }
        
        viewModel.openUrlFrom(location: Location(name: "India",
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
        guard let viewModel = self.viewModel else {
            XCTFail()
            return
        }
        
        viewModel.openUrlFrom(location: Location(name: "India", latitude: nil, longitude: nil),
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
