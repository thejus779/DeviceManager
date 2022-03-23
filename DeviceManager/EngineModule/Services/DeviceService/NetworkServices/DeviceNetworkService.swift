//
//  DeviceNetworkService.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation

class DeviceNetworkService: DeviceService {
    var searchDevicesDataTask: URLSessionDataTask?
    
    func searchDevice(with query: String, completion: @escaping ResultCallback<[Device]>) {
        // 1. Cancel previous request if any, query string updated
        cancelAnyOngoingRequest()
        
        // 2. Make api calls and return the result in completion asynchronously
    }
    
    func cancelAnyOngoingRequest() {
        searchDevicesDataTask?.cancel()
    }
    
    func getAllDevices(completion: @escaping ResultCallback<[Device]>) {
        // 1. Make api calls and return the result in completion asynchronously
    }
    func loadMockedDevices() -> [Device] { [] }
}
