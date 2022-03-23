//
//  DeviceErrors.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation

/// DeviceError with some general error types
enum DeviceError: LocalizedError, Equatable {
    case codingError
    case unknown
    case noData
    
    public var errorDescription: String? {
        switch self {
        case .codingError:
            return L10n.Common.Error.coding
        case .unknown:
            return L10n.Common.Error.unknown
        case .noData:
            return L10n.Common.Error.noData
        }
    }
}
