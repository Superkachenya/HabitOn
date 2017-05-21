//
//  CreateHabitPickerPopup.swift
//  HabitOn
//
//  Created by Danil on 20.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit
import Presentr

protocol CreateHabitPickerPopupDelegate {
    func pickerValueSelected(_ value: Any?)
    func pickerDismissed()
}

class CreateHabitPickerPopup: BaseVC, StoryBoardLoadableVC {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var okButton: UIButton!
    
    var delegate: CreateHabitPickerPopupDelegate?
    var type: CreateHabitType.RawValue?
    
    lazy var days: [String] = {
        var result = [String]()
        for day in 1...31 {
            result.append("\(day)")
        }
            return result
    }()
    lazy var tags: [Any] = {
        
       return []
    }()
    fileprivate var selectedValue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.picker.dataSource = self
        self.picker.delegate = self
        self.picker.backgroundColor = ThemeManager.currentTheme().mainColor.withAlphaComponent(0.8)
        self.okButton.setTitleColor(ThemeManager.currentTheme().textColor, for: .normal)
        self.okButton.backgroundColor = ThemeManager.currentTheme().mainColor.withAlphaComponent(0.8)
    }
    @IBAction func okButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) { 
            self.delegate?.pickerValueSelected(self.selectedValue)
        }
        print("Ok pressed")
    }
}

extension CreateHabitPickerPopup: PresentrDelegate {
    func presentrShouldDismiss(keyboardShowing: Bool) -> Bool {
        self.delegate?.pickerDismissed()
        print("Something")
        return !keyboardShowing
    }
}

extension CreateHabitPickerPopup: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.days.count
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let string = self.days[row]
        return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName:ThemeManager.currentTheme().textColor])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedValue = row
        print(self.days[row])
    }
}
