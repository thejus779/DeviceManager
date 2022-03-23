//
//  AppDelegate.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    // Single source of truth, should not be initialized anywhere else
    private lazy var engine: Engine = {
        return Engine(deviceService: MockedDeviceService())
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appCoordinator = AppCoordinator(engine: engine, launchOptions: launchOptions)
        Self.configureNavigationBarAppearance()
        return true
    }
        
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
}


extension AppDelegate {
    /// Configure Navigation bar general appearance
    static func configureNavigationBarAppearance(color: UIColor = .systemBrown) {
        let navBarAppearance = UINavigationBar.appearance()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = color
        appearance.titleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 14.0),
            .foregroundColor: UIColor.white
        ]
        navBarAppearance.standardAppearance = appearance
        navBarAppearance.scrollEdgeAppearance = appearance
        navBarAppearance.tintColor = .white
    }
}
