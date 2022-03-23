//
//  TestUtils.swift
//  DeviceManagerTests
//
//  Created by Thejus Thejus on 23/03/2022.
//

import Foundation
@testable import DeviceManager

struct TestUtils {
    static let searchQuery = "a"
    static let invalidSearchQuery = "123asd13--..1..2"
    static let engine = Engine(deviceService: MockedDeviceService())
    
}
