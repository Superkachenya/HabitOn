//
//  CreateHabitPopup.swift
//  HabitOn
//
//  Created by Danil on 20.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit
import Presentr

protocol CreateHabitTimePickerPopupDelegate {
    func pickerValueSelected(_ value: Any?)
    func pickerDismissed()
}

class CreateHabitTimePickerPopup: BaseVC, StoryBoardLoadableVC {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var okButton: UIButton!

    var delegate: CreateHabitTimePickerPopupDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.datePicker.backgroundColor = ThemeManager.currentTheme().mainColor.withAlphaComponent(0.8)
        self.datePicker.setValue(ThemeManager.currentTheme().textColor, forKey: "textColor")
        self.okButton.setTitleColor(ThemeManager.currentTheme().textColor, for: .normal)
        self.okButton.backgroundColor = ThemeManager.currentTheme().mainColor.withAlphaComponent(0.8)
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        let date = self.datePicker.date
        print(date)
    }
}

extension CreateHabitTimePickerPopup: PresentrDelegate {
    func presentrShouldDismiss(keyboardShowing: Bool) -> Bool {
        self.delegate?.pickerDismissed()
        return !keyboardShowing
    }
}
