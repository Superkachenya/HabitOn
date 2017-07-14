//
//  CreateHabitPickerPopup.swift
//  HabitOn
//
//  Created by Danil on 20.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit
import Presentr

protocol PickerPopupDelegate {
    func pickerValueSelected(_ value: Any?)
    func pickerDismissed()
}

class PickerPopup: BaseVC {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var okButton: UIButton!
    
    var delegate: PickerPopupDelegate?
    var type: CreateHabitType.RawValue?
    
    //TODO: FIX IT
    var content: [Any]?
    
    fileprivate var selectedValue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.dataSource = self
        self.picker.delegate = self
        self.picker.backgroundColor = UIColor.mainColor.withAlphaComponent(0.8)
        self.okButton.setTitleColor(.textColor, for: .normal)
        self.okButton.backgroundColor = UIColor.mainColor.withAlphaComponent(0.8)
    }
    @IBAction func okButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.pickerValueSelected(self.selectedValue)
        }
        print("Ok pressed")
    }
}

extension PickerPopup: PresentrDelegate {
    func presentrShouldDismiss(keyboardShowing: Bool) -> Bool {
        self.delegate?.pickerDismissed()
        print("Something")
        return !keyboardShowing
    }
}

extension PickerPopup: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.content?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        if let obj = content?[row] as? Tag {
            return NSAttributedString(string: obj.title!, attributes: [NSForegroundColorAttributeName:UIColor.textColor])
        } else {
            let string = content?[row] as! String

            return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName:UIColor.textColor])
 
        }
        
        return nil //NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName:UIColor.textColor])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedValue = row
    }
}
