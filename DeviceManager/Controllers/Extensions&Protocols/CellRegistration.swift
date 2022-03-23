//
//  CellRegistration.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 24/03/2022.
//

import Foundation
import UIKit

/// Protocol to help register cells
protocol CellRegistration: AnyObject {
    var tableView: UITableView! { get }
}
extension CellRegistration {
    func registerCell<T>(cell: T.Type) where T : UITableViewCell {
        tableView.register(
            T.kUINib,
            forCellReuseIdentifier: T.kReuseIdentifier
        )
    }
}
