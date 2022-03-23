//
//  HomeViewModelTests.swift
//  DeviceManagerTests
//
//  Created by Thejus Thejus on 23/03/2022.
//

import XCTest
@testable import DeviceManager

class HomeViewModelTests: XCTestCase {
    
    let engine: Engine = TestUtils.engine
    lazy var viewModel = HomeViewModel(engine: engine)
    
    // Test loading all devices from viewmodel
    func testGetAllDevices() {
        let expectation = self.expectation(description: "testGetAllDevices")
        viewModel.getAllDevices {[weak self] result in
            XCTAssertFalse(self?.viewModel.allDevices.isEmpty ?? true)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
