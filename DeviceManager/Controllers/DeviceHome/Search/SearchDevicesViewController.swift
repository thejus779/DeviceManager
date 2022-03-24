//
//  SearchDevicesViewController.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import UIKit

class SearchDevicesViewController: UIViewController, Spawnable, DeviceCellProtocol {
    
    @IBOutlet private var searchBarView: UISearchBar!
    @IBOutlet private weak var noDataLabel: UILabel!
    @IBOutlet internal weak var tableView: UITableView!
    
    private var viewModel: SearchDeviceViewModel!
    private weak var homeCoordinatorDelegate: HomeCoordinatorDelegate?
    
    static var storyboardName: String? = Storyboards.Main.storyboardName.rawValue
    
    static func spawn(homeCoordinatorDelegate: HomeCoordinatorDelegate?, viewModel: SearchDeviceViewModel) -> SearchDevicesViewController {
        let controller = SearchDevicesViewController.spawn()
        controller.homeCoordinatorDelegate = homeCoordinatorDelegate
        controller.viewModel = viewModel
        return controller
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = searchBarView
        searchBarView.searchTextField.backgroundColor = .white
        
        registerCell(cell: DeviceTableViewCell.self)
        reloadData()
        
        setAccessibilityIdentifiers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        searchBarView.searchTextField.becomeFirstResponder()
    }
    
    private func setAccessibilityIdentifiers() {
        searchBarView.searchTextField.accessibilityIdentifier = "searchDevicesSearchBar"
    }
    // Reload data
    private func reloadData() {
        tableView.isHidden = viewModel.searchedDevices.isEmpty
        tableView.reloadData()
        
        noDataLabel.text = searchBarView.searchTextField.text?.isEmpty ?? true
        ?  L10n.Searchdevicesviewcontroller.Label.search
        : L10n.Searchdevicesviewcontroller.Label.nodata
        noDataLabel.isHidden = !viewModel.searchedDevices.isEmpty
    }
    
    private func loadData(with query: String) {
        noDataLabel.isHidden = true
        viewModel.searchDevices(with: query) { [weak self] result in
            switch result {
            case .success:
                self?.reloadData()
            case .failure(let error):
                self?.presentAlert(message: error.localizedDescription, completion: nil)
            }
        }
    }
}
// MARK: - UISearchBarDelegate
extension SearchDevicesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            loadData(with: searchText)
        } else {
            viewModel.reset()
            reloadData()
        }
    }
}
// MARK: - TableViewDelegates and Datasource
extension SearchDevicesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.searchedDevices.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellForRow(at: indexPath)
        cell.configure(
            viewModel: DeviceCellViewModel(
                device: viewModel.searchedDevices[indexPath.row]
            )
        )
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeCoordinatorDelegate?.showDetails(for: viewModel.searchedDevices[indexPath.row])
    }
}
