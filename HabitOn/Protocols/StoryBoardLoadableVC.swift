//
//  StoryBoardLoadableVC.swift
//  HabitOn
//
//  Created by Danil on 20.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import UIKit

protocol StoryBoardLoadableVC {}

extension StoryBoardLoadableVC where Self: UIViewController {
    
    static func loadFromStoryBoard() -> UIViewController {
        
        let storyboard = UIStoryboard(name: String(describing:self), bundle: nil)
        guard let controller = storyboard.instantiateInitialViewController() else {
            fatalError("Unexpectable behaviour")
        }
        return controller
    }
}
