//
//  MockedDeviceService.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation

class MockedDeviceService: DeviceService {
    // Only used when using a real api/network call to cancel previous request
    var searchDevicesDataTask: URLSessionDataTask?
    
    func searchDevice(with query: String, completion: @escaping ResultCallback<[Device]>) {
        completion(.success(loadMockedDevices().filter({ $0.name.containsIgnoringCase(query) })))
    }
    
    // Nothing to cancel in mocked
    func cancelAnyOngoingRequest() { }
    
    func getAllDevices(completion: @escaping ResultCallback<[Device]>) {
        completion(.success(loadMockedDevices()))
    }
    
    func loadMockedDevices() -> [Device] {
        let mockedDevice = "device_list"
        do {
            return try JsonLoader().loadResourceJson(filename: mockedDevice, to: [Device].self)
        } catch {
            fatalError("Failed to load file named \(mockedDevice)")
        }
    }

}
extension String {
    func containsIgnoringCase(_ value: String) -> Bool{
        return self.range(of: value, options: .caseInsensitive) != nil
    }
}
