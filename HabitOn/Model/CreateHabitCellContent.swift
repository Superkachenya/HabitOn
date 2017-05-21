//
//  CreateHabitTitle.swift
//  HabitOn
//
//  Created by Danil on 16.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import Foundation
import LocalizationKit

enum CreateHabitType: Int {
    case Days
    case Notification
    case NotificationTime
    case Tag
}

struct CreateHabitCellContent {
    
    static func titleForCell(at index: CreateHabitType) -> String {
        
        switch index {
        case CreateHabitType.Days:
           return Localization.get("String.Days.to.complete", alternate: "Days to complete")
        case CreateHabitType.Notification:
            return Localization.get("String.Turn.on.notifications", alternate: "Turn on notifications")
        case CreateHabitType.NotificationTime:
            return Localization.get("String.Select.time.for.notifications", alternate: "Select time for notifications")
        case CreateHabitType.Tag:
            return Localization.get("String.Select.the.tag", alternate: "Select the tag")
        }
    }
}
