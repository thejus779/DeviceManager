//
//  ElementType.swift
//  DeviceManagerUITests
//
//  Created by Thejus Thejus on 22/03/2022.
//

import XCTest

enum ElementType {
    case textField
    case staticText
    case button
    case secureTextField
    case toolbarButton
    case image
    case searchField

    init?(_ text: String) {
        if XCUIApplication().textFields[text].exists {
            self = .textField
        } else if XCUIApplication().buttons[text].exists {
            self = .button
        } else if XCUIApplication().secureTextFields[text].exists {
            self = .secureTextField
        } else if XCUIApplication().toolbars.buttons[text].exists {
            self = .toolbarButton
        } else if XCUIApplication().staticTexts[text].exists {
            self = .staticText
        } else if XCUIApplication().images[text].exists {
            self = .image
        } else if XCUIApplication().searchFields[text].exists {
            self = .searchField
        } else {
            return nil
        }
    }

    func getElement(with text: String) -> XCUIElement {
        switch self {
        case .textField:
            return XCUIApplication().textFields[text]
        case .staticText:
            return XCUIApplication().staticTexts[text]
        case .button:
            return XCUIApplication().buttons[text]
        case .secureTextField:
            return XCUIApplication().secureTextFields[text]
        case .toolbarButton:
            return XCUIApplication().toolbars.buttons[text]
        case .image:
            return XCUIApplication().images[text]
        case .searchField:
            return XCUIApplication().searchFields[text]

        }
    }
}
