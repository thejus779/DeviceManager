//
//  DeviceManagerUITests.swift
//  DeviceManagerUITests
//
//  Created by Thejus Thejus on 22/03/2022.
//

import XCTest

class DeviceManagerUITests: XCTestCase {

    // Create an Instance of the app
    let app = XCUIApplication()

    // Launch the instance of the app
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testHomeUI() {
        
        // Atleats 1 element in table
        XCTAssertTrue(app.tables.cells.count > 0)
        
        // Tap first element, if first element not avaialable already failed test
        app.tables.cells.element(boundBy: 0).tap()
        
        // Check for existence of some ui elemenent from expected ui
        XCTAssertTrue(
            DeviceUI.deviceDetailsImageView.element.waitForExistence(timeout: 5)
        )
        XCTAssertTrue(app.tables.cells.count > 0)
    }

    func testSearchUI() {
        
        // Check if the search field exisits, and tap
        XCTAssertTrue(DeviceUI.homeSearchButton.element.exists)
        DeviceUI.homeSearchButton.element.tap()
        
        // Check if the search field exisits, and tap and edit
        XCTAssertTrue(DeviceUI.searchDevicesSearchBar.element.exists)
        DeviceUI.searchDevicesSearchBar.element.tap()
        DeviceUI.searchDevicesSearchBar.element.typeText(UITestUtils.searchQuery)
        
        // Rest of the Test is the same flow as HomeUI
        testHomeUI()
    }
}

enum DeviceUI: String {
    case deviceDetailsImageView
    case homeSearchButton
    case searchDevicesSearchBar
}

extension DeviceUI {
    var type: ElementType {
        guard   let type = ElementType(self.rawValue) else {
            print("Element type for \(self.rawValue) not found")
            fatalError()
        }
        print("Type is \(type)")
        return type
    }
    var element: XCUIElement {
        return type.getElement(with: self.rawValue)
    }
}
