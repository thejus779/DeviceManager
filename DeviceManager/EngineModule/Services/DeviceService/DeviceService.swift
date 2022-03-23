//
//  DeviceService.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation

protocol DeviceService: AnyObject {
    /// data task
    var searchDevicesDataTask: URLSessionDataTask? { get }
    
    /// Search devices with name
    func searchDevice(with query: String, completion: @escaping ResultCallback<[Device]>)
    
    /// Cancel any open requests
    func cancelAnyOngoingRequest()
    
    /// Load all devices
    func getAllDevices(completion: @escaping ResultCallback<[Device]>)
    
    /// Load mocked data from json file
    func loadMockedDevices() -> [Device]
}
