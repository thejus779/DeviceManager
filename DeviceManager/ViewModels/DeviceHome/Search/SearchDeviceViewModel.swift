//
//  SearchDeviceViewModel.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation
import TLogger

class SearchDeviceViewModel {
    private let engine: Engine
    var searchedDevices: [Device] = []
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    // Searches for the given string
    func searchDevices(with query: String, completion: @escaping ResultCallback<[Device]>)  {
        reset()
        engine.deviceService.searchDevice(with: query){ [weak self] result in
            switch result {
            case .success(let devices):
                self?.searchedDevices = devices
                LOG("[SearchDeviceViewModel] search results loaded for \(query)", .success)
            case .failure(let error):
                ELOG("[SearchDeviceViewModel] search failed \(error.localizedDescription)")
            }
            completion(result)
        }
    }

    func reset() {
        LOG("[SearchDeviceViewModel] reset all searched data", .delete)
        searchedDevices = []
    }
}
