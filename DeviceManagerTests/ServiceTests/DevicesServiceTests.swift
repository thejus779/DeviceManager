//
//  DeviceManagerTests.swift
//  DeviceManagerTests
//
//  Created by Thejus Thejus on 22/03/2022.
//

import XCTest
@testable import DeviceManager

class DevicesServiceTests: XCTestCase {

    let engine: Engine = TestUtils.engine
    
    func testLoadDevices() {
        let expectation = self.expectation(description: "testLoadDevices")
        engine.deviceService.getAllDevices { result in
            var devices: [Device] = []
            switch result {
            case .success(let ds):
                devices = ds
            case .failure:
                devices = []
            }
            XCTAssertFalse(devices.isEmpty)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testSearchDevices() {
        let expectation = self.expectation(description: "testSearchDevices")
        engine.deviceService.searchDevice(with: TestUtils.searchQuery) { result in
            var searchedDevices: [Device] = []
            switch result {
            case .success(let ds):
                searchedDevices = ds
            case .failure:
                searchedDevices = []
            }
            XCTAssertFalse(searchedDevices.isEmpty)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
}
