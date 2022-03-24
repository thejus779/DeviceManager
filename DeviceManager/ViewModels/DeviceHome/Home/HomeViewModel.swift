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
    var allDisplayableDevices: [Device] = []
    
    // Local Pagination elements
    static let kPageSize: Int =  8
    var pageNo: Int = 1
    
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
                self?.constructDisplayabeDevices()
            case .failure(let error):
                ELOG("[HomeViewModel] failed \(error)")
            }
            completion(result)
        }
    }
    
    // Pick only first n elements to load, next elements will be loaded as we scroll
    private func constructDisplayabeDevices() {
        allDisplayableDevices = Array(allDevices.prefix(Self.kPageSize))
    }
    
    // Load more data as we scroll down
    func loadMoreDisplayableDevices(completion: @escaping (Bool) -> Void) {
        pageNo += 1
        let previousCount = allDisplayableDevices.count
        if previousCount < allDevices.count {
            LOG("Load more", .start)
            let nextDevices = allDevices[previousCount ..< maxCount(pageNo: pageNo)]
            allDisplayableDevices.append(contentsOf: nextDevices)
            LOG("Loaded \(nextDevices.count) more data", .success)
            completion(false)
        } else {
            LOG("All data loaded already", .likeABoss)
            completion(true)
        }
    }
    
    private func maxCount(pageNo: Int) -> Int {
        min(allDevices.count, pageNo * Self.kPageSize)
    }

}
