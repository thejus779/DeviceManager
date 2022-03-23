//
//  DeviceDetailsViewModelTests.swift
//  DeviceManagerTests
//
//  Created by Thejus Thejus on 24/03/2022.
//

import XCTest
@testable import DeviceManager

class DeviceDetailsViewModelTests: XCTestCase {
    let engine: Engine = TestUtils.engine
    var devices: [Device] = []
    
    func testDeviceDetails() {
        // Load mocked data
        if let device = engine.deviceService.loadMockedDevices().first {
            let viewModel = DeviceDetailsViewModel(device: device)
            XCTAssertFalse(viewModel.allDisplayableInfo.isEmpty)
            XCTAssertTrue(device.name.uppercased() == viewModel.title)
        } else {
            // Loading mocked data failed, test failed
            XCTFail()
        }
    }
}
