//
//  Assets.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 23/03/2022.
//

import Foundation
import UIKit

internal enum Assets {
    internal static let devicePlaceholder = ImageAsset(name: "icon_device_placeholder")
    internal static let iconInfo = ImageAsset(name: "icon_info")
}

internal struct ImageAsset {
    internal fileprivate(set) var name: String
    internal var image: UIImage {
        let image = UIImage(named: name, in: Bundle.main, compatibleWith: nil)
        guard let result = image else {
            fatalError("Unable to load image named \(name).")
        }
        return result
    }
}
