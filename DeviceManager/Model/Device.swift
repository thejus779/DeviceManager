//
//  Device.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation

struct Device: Codable, Equatable {
    let id: Int
    let isAvailable: Bool
    let operatingSystem: String
    let name: String
    let imageUrl: String
    let size: Size
    
    struct Size: Codable {
        let height: Int
        let width: Int
    }
    enum CodingKeys: String, CodingKey {
        case id
        case isAvailable = "is_avalable"
        case operatingSystem = "operating_system"
        case name
        case imageUrl = "image_url"
        case size
    }
}
// Equatable conformance
extension Device {
    static func == (lhs: Device, rhs: Device) -> Bool {
        lhs.id == rhs.id
    }
}
