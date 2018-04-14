//
//  DeviceCellSource.swift
//  Home Control
//
//  Created by Arek on 08.04.2018.
//  Copyright © 2018 Arkadiusz Macudziński. All rights reserved.
//

import Foundation
import UIKit

class DeviceCellSource {
    
    func getBindedCell(_ tableView: UITableView, _ viewModel: DeviceViewModel) -> UITableViewCell {

        
        if let viewModel = viewModel as? DimmableLightDeviceViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: DimmableDeviceTableViewCell.cellIdentifier) as! DimmableDeviceTableViewCell
            cell.bind(viewModel: viewModel)
            return cell
        } else if let viewModel = viewModel as? BinaryLightDeviceViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: BinaryDeviceTableViewCell.cellIdentifier) as! BinaryDeviceTableViewCell
            cell.bind(viewModel: viewModel)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
