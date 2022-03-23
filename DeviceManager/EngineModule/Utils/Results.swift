//
//  Results.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

typealias ResultCallback<T> = (Result<T>) -> Void


enum NetworkResult {
    case success(data: Data?)
    case error(Error)
}

typealias NetworkResultCompletion = (NetworkResult) -> Void
