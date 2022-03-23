//
//  DeviceCellProtocol.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 23/03/2022.
//

import Foundation
import UIKit

protocol DeviceCellProtocol: CellRegistration {
    var tableView: UITableView! { get }
}
extension DeviceCellProtocol {
    func cellForRow(at indexPath: IndexPath) -> DeviceTableViewCell {
        guard   let cell = tableView.dequeueReusableCell(
            withIdentifier: DeviceTableViewCell.kReuseIdentifier,
            for: indexPath
        ) as? DeviceTableViewCell
        else { fatalError("Developer error") }
        return cell
    }
}
