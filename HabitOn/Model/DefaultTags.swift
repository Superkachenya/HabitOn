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
        guard let path = Bundle.main.path(forResource: "tags", ofType: "json") else { fatalError("failed to find file") }
        
        do {
            let jsonData = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let json = jsonData.components(separatedBy: ",")
            let container = CoreDataManager.shared.persistentContainer
            container.performBackgroundTask({ (context) in
                
            })
            for row in json {
                print(row)
            }
        } catch{
            
            fatalError("failed to read from file")
        }
        return []
    }()
    
//    static private func parseJSON(_ json  ) {
//        
//    }
}
