//
//  UIViewAnimation.swift
//  HabitOn
//
//  Created by Danil on 20.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

extension UIView {
    
    func rotate(completion: @escaping () -> Void) {
        let isIdeintity = self.transform.isIdentity
        UIView.animate(withDuration: 0.5, animations: {
            if isIdeintity {
                self.transform = CGAffineTransform(rotationAngle: (1.0 * CGFloat.pi))
            } else {
                self.transform = CGAffineTransform(rotationAngle: 0)
            }
        }) { (isComplete) in
            if isComplete == true, isIdeintity == true {
                completion()
            }
        }
    }
}
