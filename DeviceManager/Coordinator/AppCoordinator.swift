//
//  AppCoordinator.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation
import UIKit
import TLogger

class AppCoordinator {
    
    let engine: Engine
    
    private var window: UIWindow
    
    private var homeCoordinator: HomeCoordinator?
    var rootController: UINavigationController?
    
    init(engine: Engine, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.engine = engine
                
        // 1. Create and configure main window
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window

        // 2. Create and configure main controller
        self.configureMainController()
        
        // Simple logged used to log (Personal SPM: https://github.com/thejus779/TLogger)
        TLogger.sharedInstance.configure(isEnabled: true)
        LOG("Logging enabled", .info)

    }
    
    // MARK: - Root controller
    private func configureMainController() {
        let coordinator = configureHomeCoordinator()
        window.rootViewController = coordinator.navigationController
        rootController = coordinator.navigationController

    }

    private func configureHomeCoordinator() -> HomeCoordinator {
        let coordinator = HomeCoordinator(engine: engine)
        self.homeCoordinator = coordinator
        return coordinator
    }
}
