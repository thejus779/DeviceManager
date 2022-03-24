//
//  DeviceDetailsViewController.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 22/03/2022.
//

import UIKit

class DeviceDetailsViewController: UIViewController, Spawnable {
    
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var imageBgView: UIView!
    @IBOutlet private weak var deviceImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: DeviceDetailsViewModel!
    
    static var storyboardName: String? = Storyboards.Main.storyboardName.rawValue
    
    static func spawn(viewModel: DeviceDetailsViewModel) -> DeviceDetailsViewController {
        let controller = DeviceDetailsViewController.spawn()
        controller.viewModel = viewModel
        controller.title = viewModel.title
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBgView.layer.cornerRadius = 10
        imageBgView.shadowStyle = .medium
        deviceImageView.sd_setImage(
            with: viewModel.headerImageUrl,
            placeholderImage: Assets.devicePlaceholder.image,
            completed: nil
        )
        tableView.tableHeaderView = headerView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
extension DeviceDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.allDisplayableInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        cell.textLabel?.text = viewModel.allDisplayableInfo[indexPath.row].localizedString
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.selectionStyle = .none
        return cell
    }
}
