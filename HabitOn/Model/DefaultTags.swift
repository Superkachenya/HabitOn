//
//  DefaultTags.swift
//  HabitOn
//
//  Created by Danil on 22.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import Foundation


struct DefaultTags {
    static  let tags: [Any] = {
        guard let path = Bundle.main.url(forResource: "Tags", withExtension: "plist") else { fatalError("failed to find file") }
        
        do {
            let jsonData = try Data(contentsOf: path)
            do {
                let json = try PropertyListSerialization.propertyList(from: jsonData, options: [], format: nil) as? [[String : Any]]
                print(json as Any)
            } catch {
                beaverLog.error(error)
            }
            
        } catch{
            beaverLog.error(error)
        }
        return []
    }()
    
    static private func parseJSON(_ json: [[String:Any]]) {
        
    }
}
