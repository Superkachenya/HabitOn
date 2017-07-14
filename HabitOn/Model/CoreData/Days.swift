//
//  Days.swift
//  HabitOn
//
//  Created by Danil on 27.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import Foundation


struct Days {
    static let days: [String] = {
        var result = [String]()
        for day in 1...31 {
            result.append("\(day)")
        }
        return result
    }()
}
