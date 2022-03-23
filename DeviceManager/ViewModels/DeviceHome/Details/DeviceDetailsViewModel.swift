//
//  DeviceDetailsViewModel.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation

class DeviceDetailsViewModel {
    private let device: Device
    
    var allDisplayableInfo: [DeviceInfo] = []
    
    init(device: Device) {
        self.device = device
        self.allDisplayableInfo = constructDisplayableInfo(for: device)
    }
    
    struct DeviceInfo {
        let name: String
        let value: String
        
        var localizedString: String {
            "\(name) - \(value)"
        }
    }
    func constructDisplayableInfo(for device: Device) -> [DeviceInfo] {
        let nameInfo = DeviceInfo(
            name: L10n.Devicedetailsviewcontroller.Label.name,
            value: device.name
        )
        let osInfo = DeviceInfo(
            name: L10n.Devicedetailsviewcontroller.Label.operatingsystem,
            value: device.operatingSystem
        )
        let availabilityInfo = DeviceInfo(
            name: L10n.Devicedetailsviewcontroller.Label.status,
            value: device.isAvailable
                ? L10n.Devicedetailsviewcontroller.Label.Status.available
                : L10n.Devicedetailsviewcontroller.Label.Status.unavailable
        )
        let size = DeviceInfo(
            name: L10n.Devicedetailsviewcontroller.Label.size,
            value: "\(device.size.height) x \(device.size.width)"
        )
        return [nameInfo, osInfo, availabilityInfo, size]
    }
    
    var headerImageUrl: URL? {
        URL(string: device.imageUrl)
    }
    var title: String {
        device.name.uppercased()
    }
}
