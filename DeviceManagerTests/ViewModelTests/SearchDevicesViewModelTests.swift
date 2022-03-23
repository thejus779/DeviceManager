//
//  SearchDevicesViewModelTests.swift
//  DeviceManagerTests
//
//  Created by Thejus Thejus on 23/03/2022.
//

import XCTest
@testable import DeviceManager

class SearchDevicesViewModelTests: XCTestCase {
    
    let engine: Engine = TestUtils.engine
    lazy var viewModel = SearchDeviceViewModel(engine: engine)
    
    // Test searching with a valid query
    func testValidSearch() {
        let expectation = self.expectation(description: "testValidSearch")
        viewModel.searchDevices(with: TestUtils.searchQuery) { [weak self] result in
            XCTAssertFalse(self?.viewModel.searchedDevices.isEmpty ?? true)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    // Test searching with an invalid query
    func testInvalidSearch() {
        let expectation = self.expectation(description: "testInvalidSearch")
        viewModel.searchDevices(with: TestUtils.invalidSearchQuery) { [weak self] result in
            XCTAssertTrue(self?.viewModel.searchedDevices.isEmpty ?? false)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
