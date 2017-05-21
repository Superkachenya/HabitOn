//
//  CreateHabitTableViewDataSource.swift
//  HabitOn
//
//  Created by Danil on 18.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

extension CreateHabitVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case CreateHabitType.Notification.rawValue:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SwitchTableCell
            cell.configure(indexPath.row)
            cell.delegate = self
            return cell
        case CreateHabitType.NotificationTime.rawValue:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ButtonTableCell
            cell.delegate = self
            if self.notificationsIsOn == false {
                cell.configure(indexPath.row + 1)
            } else {
                cell.configure(indexPath.row)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ButtonTableCell
            cell.delegate = self
            cell.configure(indexPath.row)
            return cell
        }
    }
}
