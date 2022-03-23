//
//  Engine.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation

class Engine {
    
    // Services
    let deviceService: DeviceService
    
    init(deviceService: DeviceService? = nil) {
        self.deviceService = deviceService ?? DeviceNetworkService()
    }
}
