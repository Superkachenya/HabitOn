//
//  CreateHabitPopup.swift
//  HabitOn
//
//  Created by Danil on 20.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit
import Presentr

protocol TimePickerPopupDelegate {
    func timePickerValueSelected(_ value: Date)
    func timePickerDismissed()
}

class TimePickerPopup: BaseVC, StoryBoardLoadableVC {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var okButton: UIButton!
    
    var delegate: TimePickerPopupDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.backgroundColor = UIColor.mainColor.withAlphaComponent(0.8)
        self.datePicker.setValue(UIColor.textColor, forKey: "textColor")
        self.okButton.setTitleColor(.textColor, for: .normal)
        self.okButton.backgroundColor = UIColor.mainColor.withAlphaComponent(0.8)
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.timePickerValueSelected(self.datePicker.date)
        }
    }
}

extension TimePickerPopup: PresentrDelegate {
    func presentrShouldDismiss(keyboardShowing: Bool) -> Bool {
        self.delegate?.timePickerDismissed()
        return !keyboardShowing
    }
}
