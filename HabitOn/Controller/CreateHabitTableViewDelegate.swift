//
//  CreateHabitTableViewDelegate.swift
//  HabitOn
//
//  Created by Danil on 18.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

extension CreateHabitVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}
