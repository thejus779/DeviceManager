//
//  DeviceCellViewModel.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 23/03/2022.
//

import Foundation

struct DeviceCellViewModel {
    let device: Device

    init(device: Device) {
        self.device = device
    }
    
    var name: String {
        device.name
    }
    var statusValue: String {
        let availablityText = device.isAvailable
        ? L10n.Devicedetailsviewcontroller.Label.Status.available
        : L10n.Devicedetailsviewcontroller.Label.Status.unavailable
        return "\(L10n.Homeviewcontroller.Cell.Label.status)\(availablityText)"

    }
    var imageUrl: URL? {
        URL(string: device.imageUrl)
    }
    var availabilityStatus: Bool {
        device.isAvailable
    }
}
