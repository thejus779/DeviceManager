//
//  Strings.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 23/03/2022.
//

import Foundation

enum L10n {
    
    enum Common {
        static let error = "common.error".localized()
        static let noinfo = "common.noinfo".localized()
        enum Button {
            static let ok = "common.button.ok".localized()
        }
        enum Error {
            static let coding = "common.error.coding".localized()
            static let noData = "common.error.noData".localized()
            static let unknown = "common.error.unknown".localized()
        }
    }
    enum Homeviewcontroller {
        enum Label {
            static let header = "homeviewcontroller.label.header".localized()
        }
        enum Cell {
            enum Label {
                static let status = "homeviewcontroller.cell.label.status".localized()
            }
        }
    }
    enum Searchdevicesviewcontroller {
        enum Field {
            static let placeholder = "searchdevicesviewcontroller.field.placeholder".localized()
        }
        enum Label {
            static let nodata = "searchdevicesviewcontroller.label.nodata".localized()
            static let search = "searchdevicesviewcontroller.label.search".localized()
        }
    }
    enum Devicedetailsviewcontroller {
        enum Label {
            static let name = "devicedetailsviewcontroller.label.name".localized()
            static let operatingsystem = "devicedetailsviewcontroller.label.operatingsystem".localized()
            static let status = "devicedetailsviewcontroller.label.status".localized()
            static let size = "devicedetailsviewcontroller.label.size".localized()
            enum Status {
                static let available = "devicedetailsviewcontroller.label.status.available".localized()
                static let unavailable = "devicedetailsviewcontroller.label.status.unavailable".localized()
            }
        }
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
