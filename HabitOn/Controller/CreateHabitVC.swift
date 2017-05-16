//
//  CreateHabitVC.swift
//  HabitOn
//
//  Created by Danil on 08.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit
import LocalizationKit

class CreateHabitVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ButtonTableCell.self)
        self.tableView.register(SwitchTableCell.self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension CreateHabitVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 1:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SwitchTableCell
            cell.configure(indexPath.row)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ButtonTableCell
            return cell
        }
    }
}
