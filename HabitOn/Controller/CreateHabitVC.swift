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
    @IBOutlet weak var habitTitleTextField: CustomTextField!
    @IBOutlet weak var habitDetailsTextField: CustomTextField!
    
    var habitTitle: String?
    var habitDetails: String?
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ButtonTableCell.self)
        self.tableView.register(SwitchTableCell.self)
        
        self.habitTitleTextField.delegate = self
        self.habitDetailsTextField.delegate = self
        
        self.subscribeForKeyboardNotifications()
    }
    
    deinit {
       self.unsubscribeFromKeyboardNotifications()
    }
    
    //MARK: IBActions
    @IBAction func actionCancelPressed(_ sender: Any) {
        
    }
    
    @IBAction func actionSavePressed(_ sender: Any) {
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
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
            cell.configure(indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

extension CreateHabitVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.habitDetailsTextField {
            self.habitTitle = textField.text
            print(self.habitTitle as Any)
        } else {
            self.habitDetails = textField.text
            print(self.habitDetails as Any)
        }
        activeField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

