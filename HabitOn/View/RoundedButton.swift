//
//  SaveButton.swift
//  HabitOn
//
//  Created by Danil on 09.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let bgColor = ThemeManager.currentTheme().mainColor.withAlphaComponent(0.8)
        self.backgroundColor = UIColor.clear
        self.layer.backgroundColor = bgColor.cgColor
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = false
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
