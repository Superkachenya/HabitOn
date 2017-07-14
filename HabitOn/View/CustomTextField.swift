//
//  CustomTextField.swift
//  HabitOn
//
//  Created by Danil on 14.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.masksToBounds = false
        self.backgroundColor = UIColor.secondaryColor.withAlphaComponent(0.6)
        self.tintColor = ThemeManager.currentTheme().tintColor
        self.textColor = ThemeManager.currentTheme().textColor
        
        self.layer.cornerRadius = 8.0
    }
    //TODO: Change placeholderColor
    // Placeholder text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    // Editable text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
}
