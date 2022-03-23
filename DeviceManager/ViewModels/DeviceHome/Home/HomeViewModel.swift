//
//  HomeViewModel.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation
import TLogger

class HomeViewModel {
    private let engine: Engine
    var allDevices: [Device] = []
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    // Searches for the given string
    func getAllDevices(completion: @escaping ResultCallback<[Device]>)  {
        engine.deviceService.getAllDevices { [weak self] result in
            switch result {
            case .success(let devices):
                LOG("[HomeViewModel] all results loaded", .success)
                self?.allDevices = devices
            case .failure(let error):
                ELOG("[HomeViewModel] failed \(error)")
            }
            completion(result)
        }
    }
}
