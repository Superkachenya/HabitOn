//
//  Picker.swift
//  HabitOn
//
//  Created by Danil on 20.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

class Picker: UIView {
    
    var type: CreateHabitType = .Days
    
    init(_ type: CreateHabitType.RawValue, position: CGPoint) {
        super.init(frame: CGRect.zero)
        
        switch type {
        case CreateHabitType.Days.rawValue:
            self.frame = CGRect(x: position.x, y: position.y, width: 130.0, height: 140.0)
        case CreateHabitType.NotificationTime.rawValue:
            self.frame = CGRect(x: position.x, y: position.y, width: 160.0, height: 140.0)
        case CreateHabitType.Tag.rawValue:
            self.frame = CGRect(x: position.x, y: position.y, width: 160.0, height: 140.0)
        default:
            self.frame = CGRect.zero
        }
        self.addPickerView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPickerView() {
        let picker = UIPickerView.init(frame: self.frame)
        picker.backgroundColor = UIColor.white
        picker.tintColor = ThemeManager.currentTheme().tintColor
        picker.rowSize(forComponent: 20)
        picker.dataSource = self
        picker.delegate = self
        self.addSubview(picker)
    }
}

extension Picker: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch self.type {
        case .Days:
            return 1
        default:
            return 2
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 8
    }
    
}
