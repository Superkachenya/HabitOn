//
//  ViewController.swift
//  HabitOn
//
//  Created by Danil on 08.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit
import SwiftyBeaver


class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ThemeManager.applyTheme(theme: .Dark)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        beaverLog.warning("MemoryWarning")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
