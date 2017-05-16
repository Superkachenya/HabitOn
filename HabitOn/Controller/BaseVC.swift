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

    let log = SwiftyBeaver.self

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ThemeManager.applyTheme(theme: .Dark)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.log.warning("MemoryWarning")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
