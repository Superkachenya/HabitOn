//
//  UIViewExtension.swift
//  HabitOn
//
//  Created by Danil on 09.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {
    
    @IBInspectable var addShadow: Bool {
        get {
            return materialKey
        }
        set {
            materialKey = newValue
            
            if materialKey {
                self.layer.masksToBounds = false
                self.layer.shadowOpacity = 0.4
                self.layer.shadowRadius = 4.0
                self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
                self.layer.shadowColor = UIColor.white.cgColor
            } else {
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
            }
        }
        
    }
    
}
