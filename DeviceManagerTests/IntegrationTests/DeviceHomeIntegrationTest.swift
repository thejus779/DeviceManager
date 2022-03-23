//
//  DeviceHomeIntegrationTest.swift
//  DeviceManagerTests
//
//  Created by Thejus Thejus on 24/03/2022.
//

import XCTest
@testable import DeviceManager

class DeviceHomeIntegrationTest: XCTestCase {
    
    let engine: Engine = TestUtils.engine
    lazy var viewModel = SearchDeviceViewModel(engine: engine)
    
    func testSearchAndDetails() {
        // 1. Search for the query
        let expectation = self.expectation(description: "testValidSearch")
        viewModel.searchDevices(with: TestUtils.searchQuery) { [weak self] result in
            XCTAssertFalse(self?.viewModel.searchedDevices.isEmpty ?? true)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        
        // 2. Details for the loaded devices
        if let device = viewModel.searchedDevices.first {
            let deviceDetailsViewModel = DeviceDetailsViewModel(device: device)
            XCTAssertFalse(deviceDetailsViewModel.allDisplayableInfo.isEmpty)
            XCTAssertTrue(device.name.uppercased() == deviceDetailsViewModel.title)
        } else {
            XCTFail("Should have never reached here, wrong data flow")
        }
    }
}
