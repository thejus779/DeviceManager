//
//  Strings.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 23/03/2022.
//

import Foundation

internal enum L10n {
    
    internal enum Common {
        internal static let error = "common.error".localized()
        internal static let noinfo = "common.noinfo".localized()
        internal enum Button {
            internal static let ok = "common.button.ok".localized()
        }
        internal enum Error {
            internal static let coding = "common.error.coding".localized()
            internal static let noData = "common.error.noData".localized()
            internal static let unknown = "common.error.unknown".localized()
        }
    }
    internal enum Homeviewcontroller {
        internal enum Label {
            internal static let header = "homeviewcontroller.label.header".localized()
        }
        internal enum Cell {
            internal enum Label {
                internal static let status = "homeviewcontroller.cell.label.status".localized()
            }
        }
    }
    internal enum Searchdevicesviewcontroller {
        internal enum Field {
            internal static let placeholder = "searchdevicesviewcontroller.field.placeholder".localized()
        }
    }
    internal enum Devicedetailsviewcontroller {
        internal enum Label {
            internal static let name = "devicedetailsviewcontroller.label.name".localized()
            internal static let operatingsystem = "devicedetailsviewcontroller.label.operatingsystem".localized()
            internal static let status = "devicedetailsviewcontroller.label.status".localized()
            internal static let size = "devicedetailsviewcontroller.label.size".localized()
            internal enum Status {
                internal static let available = "devicedetailsviewcontroller.label.status.available".localized()
                internal static let unavailable = "devicedetailsviewcontroller.label.status.unavailable".localized()
            }
        }
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
