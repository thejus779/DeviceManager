//
//  DeviceTableViewCell.swift
//  DeviceManager
//
//  Created by Thejus Thejus on 23/03/2022.
//

import UIKit
import SDWebImage

class DeviceTableViewCell: UITableViewCell {

    @IBOutlet private weak var deviceStatusLabel: UILabel!
    @IBOutlet private weak var deviceNameLabel: UILabel!
    @IBOutlet private weak var deviceImageView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.shadowStyle = .medium
    }

    func configure(viewModel: DeviceCellViewModel) {
        deviceNameLabel.text = viewModel.name
        deviceStatusLabel.text = viewModel.statusValue
        deviceStatusLabel.textColor = viewModel.availabilityStatus ? .green : .red
        deviceImageView.sd_setImage(
            with: viewModel.imageUrl,
            placeholderImage: Assets.devicePlaceholder.image,
            completed: nil
        )
    }
}
