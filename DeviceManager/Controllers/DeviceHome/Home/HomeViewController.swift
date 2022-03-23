//
//  HomeViewController.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import UIKit

class HomeViewController: UIViewController, Spawnable, DeviceCellProtocol {
    
    @IBOutlet private weak var headerTitleLabel: UILabel!
    @IBOutlet internal weak var tableView: UITableView!
    
    private var viewModel: HomeViewModel!
    
    private weak var homeCoordinatorDelegate: HomeCoordinatorDelegate?
    
    static var storyboardName: String? = Storyboards.Main.storyboardName.rawValue
    
    static func spawn(homeCoordinatorDelegate: HomeCoordinatorDelegate?, viewModel: HomeViewModel) -> HomeViewController {
        let controller = HomeViewController.spawn()
        controller.homeCoordinatorDelegate = homeCoordinatorDelegate
        controller.viewModel = viewModel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        registerCell(cell: DeviceTableViewCell.self)
        headerTitleLabel.text = L10n.Homeviewcontroller.Label.header
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // Reload data
    private func reloadData() {
        tableView.reloadData()
    }
    
    private func loadData() {
        viewModel.getAllDevices { [weak self] result in
            switch result {
            case .success:
                self?.reloadData()
            case .failure(let error):
                self?.presentAlert(message: error.localizedDescription, completion: nil)
            }
        }
    }
    @IBAction func onTouchUpInsideSearch(_ sender: Any) {
        homeCoordinatorDelegate?.showSearchViewController()
    }
    
}
// MARK: - TableViewDelegates and Datasource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.allDevices.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellForRow(at: indexPath)
        cell.configure(
            viewModel: DeviceCellViewModel(
                device: viewModel.allDevices[indexPath.row]
            )
        )
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeCoordinatorDelegate?.showDetails(for: viewModel.allDevices[indexPath.row])
    }
}
