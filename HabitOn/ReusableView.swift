//
//  ReusableView.swift
//  HabitOn
//
//  Created by Danil on 16.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}


