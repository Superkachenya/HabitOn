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
    case days
    case notification
    case notificationTime
    case tag
}

struct CreateHabitCellContent {
    
    static func titleForCell(at index: Int) -> String {
        
        switch index {
        case CreateHabitType.days.rawValue:
           return Localization.get("String.Days.to.complete", alternate: "Days to complete")
        case CreateHabitType.notification.rawValue:
            return Localization.get("String.Turn.on.notifications", alternate: "Turn on notifications")
        case CreateHabitType.notificationTime.rawValue:
            return Localization.get("String.Select.time.for.notifications", alternate: "Select time for notifications")
        case CreateHabitType.tag.rawValue:
            return Localization.get("String.Select.the.tag", alternate: "Select the tag")
        default:
            return ""
        }
    }
}
