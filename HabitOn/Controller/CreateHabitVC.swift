//
//  CreateHabitVC.swift
//  HabitOn
//
//  Created by Danil on 08.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit
import LocalizationKit
import Presentr

class CreateHabitVC: BaseVC {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var habitTitleTextField: CustomTextField!
    @IBOutlet weak var habitDetailsTextField: CustomTextField!
    @IBOutlet weak var headerTitleLabel: UILabel!
    
    var habitTitle: String?
    var habitDetails: String?
    var activeField: UITextField?
    var rowsCount: Int = 3
    var notificationsIsOn: Bool = false
    var selectedButton: UIButton?
    
    lazy var presenter: Presentr = {
        let width = ModalSize.fluid(percentage: 0.50)
        let height = ModalSize.fluid(percentage: 0.30)
        let center = ModalCenterPosition.center
        let customType = PresentationType.custom(width: width, height: height, center: center)
        
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverHorizontalFromRight
        customPresenter.dismissTransitionType = .coverHorizontalFromRight
        customPresenter.roundCorners = true
        customPresenter.backgroundColor = .black
        customPresenter.backgroundOpacity = 0.5
        customPresenter.dismissOnSwipe = true
        customPresenter.dismissOnSwipeDirection = .bottom
        
        return customPresenter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ButtonTableCell.self)
        self.tableView.register(SwitchTableCell.self)
        
        self.habitTitleTextField.delegate = self
        self.habitDetailsTextField.delegate = self
        self.headerTitleLabel.textColor = ThemeManager.currentTheme().textColor
        
        
        self.subscribeForKeyboardNotifications()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    deinit {
        self.unsubscribeFromKeyboardNotifications()
    }
    
    //MARK: IBActions
    @IBAction func actionCancelPressed(_ sender: UIButton) {
        sender.rotate(angle: 135.0)
    }
    @IBAction func actionSavePressed(_ sender: Any) {
        
    }
}

extension CreateHabitVC: SwitchTableCellDelegate {
    
    func enableNotifications(_ flag: Bool) {
        self.notificationsIsOn = flag
        let indexPath = IndexPath(row: CreateHabitType.NotificationTime.rawValue, section: 0)
        self.tableView.beginUpdates()
        if flag == true {
            self.rowsCount = self.rowsCount + 1
            self.tableView.insertRows(at: [indexPath], with: .top)
        } else {
            self.rowsCount = self.rowsCount - 1
            self.tableView.deleteRows(at: [indexPath], with: .bottom)
        }
        self.tableView.endUpdates()
    }
}

extension CreateHabitVC: ButtonTableCellDelegate {
    
    func showPopup(for index: Int, from button: UIButton) {
        self.selectedButton = button
        
        //create PickerPopup
        let popupVC =  PickerPopup.init(nibName: String(describing:PickerPopup.self), bundle: nil)
        popupVC.delegate = self
        
        switch index {
        case CreateHabitType.NotificationTime.rawValue:
            if self.notificationsIsOn == true {
                
                //create TimePickerPopup
                let timePickerPopup = TimePickerPopup.init(nibName: String(describing:TimePickerPopup.self), bundle: nil)
                timePickerPopup.delegate = self
                
                customPresentViewController(presenter, viewController: timePickerPopup, animated: true, completion: nil)
            } else {
                
                customPresentViewController(presenter, viewController: popupVC, animated: true, completion: nil)
            }
        default:
            customPresentViewController(presenter, viewController: popupVC, animated: true, completion: nil)
        }
    }
}

extension CreateHabitVC: PickerPopupDelegate {
    func pickerValueSelected(_ value: Any?) {
        if let button = self.selectedButton {
            button.rotate(angle: 180.0)
        }
    }
    func pickerDismissed() {
        if let button = self.selectedButton {
            button.rotate(angle: 180.0)
        }
    }
}

extension CreateHabitVC: TimePickerPopupDelegate {
    
    func timePickerValueSelected(_ value: Date) {
        if let button = self.selectedButton {
            button.rotate(angle: 180.0)
        }
    }
    
    func timePickerDismissed() {
        if let button = self.selectedButton {
            button.rotate(angle: 180.0)
        }
    }
    
}
//MARK: UITextFieldDelegate
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
