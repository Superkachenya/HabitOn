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
            
        case CreateHabitType.notification.rawValue:
            
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SwitchTableCell
            self.configureSwitch(cell, with: type, delegate: self)
            
            return cell
            
        case CreateHabitType.notificationTime.rawValue:
            
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ButtonTableCell
            if self.notificationsIsOn == false {
                let dinamycType = CreateHabitType.tags
                self.configureButon(cell, with: dinamycType, at: indexPath.row + 1, delegate: self)
            } else {
                self.configureButon(cell, with: type, at: indexPath.row, delegate: self)
            }
            
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ButtonTableCell
            self.configureButon(cell, with: type, at: indexPath.row, delegate: self)
            
            return cell
        }
    }
    
    func configureSwitch(_ cell: SwitchTableCell, with contentType: CreateHabitType, delegate: SwitchTableCellDelegate) {
        cell.configure(with: CreateHabitCellContent.titleForCell(at: contentType), delegate: delegate)
    }
    
    func configureButon(_ cell : ButtonTableCell, with type:CreateHabitType, at index: Int, delegate: ButtonTableCellDelegate) {
        cell.configure(with: CreateHabitCellContent.titleForCell(at: type), index: index, delegate: delegate)
    }
}
