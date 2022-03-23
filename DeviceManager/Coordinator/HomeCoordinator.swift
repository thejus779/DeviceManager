//
//  AppCoordinator.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func showDetails(for device: Device)
    func showSearchViewController()
}

class HomeCoordinator: NSObject {
    
    var navigationController: UINavigationController
    let engine: Engine
    

    init(engine: Engine) {
        self.engine = engine
        navigationController = HideBackTitleNavigationController()
        
        super.init()
        
        let homeViewController = HomeViewController.spawn(
            homeCoordinatorDelegate: self,
            viewModel: HomeViewModel(engine: engine)
        )
        navigationController.setViewControllers([homeViewController], animated: false)
        navigationController.isNavigationBarHidden = true

    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func showDetails(for device: Device) {
        let deviceDetailsViewController = DeviceDetailsViewController.spawn(
            viewModel: DeviceDetailsViewModel(device: device)
        )
        navigationController.pushViewController(
            deviceDetailsViewController, animated: true
        )
    }
    func showSearchViewController() {
        let searchDevicesViewController = SearchDevicesViewController.spawn(
            homeCoordinatorDelegate: self,
            viewModel: SearchDeviceViewModel(engine: engine)
        )
        navigationController.pushViewController(
            searchDevicesViewController, animated: true
        )
    }
}
