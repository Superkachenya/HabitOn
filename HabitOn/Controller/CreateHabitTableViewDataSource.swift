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
        guard let type = CreateHabitType(rawValue: indexPath.row) else { fatalError("Unexpectable row index") }
        
        switch indexPath.row {
            
        case CreateHabitType.Notification.rawValue:
            
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SwitchTableCell
            
            self.configureSwitch(cell, with: type)
            cell.delegate = self
            
            return cell
            
        case CreateHabitType.NotificationTime.rawValue:
            
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ButtonTableCell
            
            cell.delegate = self
            if self.notificationsIsOn == false {
                let dinamycType = CreateHabitType.Tag
                self.configureButon(cell, with: dinamycType, at: indexPath.row + 1)
            } else {
                self.configureButon(cell, with: type, at: indexPath.row)
            }
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ButtonTableCell
            cell.delegate = self
            self.configureButon(cell, with: type, at: indexPath.row)
            
            return cell
        }
    }
    
    func configureSwitch(_ cell: SwitchTableCell, with contentType: CreateHabitType) {
        cell.configure(with: CreateHabitCellContent.titleForCell(at: contentType))
    }
    func configureButon(_ cell : ButtonTableCell, with type:CreateHabitType, at index: Int) {
        cell.configure(with: CreateHabitCellContent.titleForCell(at: type), index: index)
    }
}
