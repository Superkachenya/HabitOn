//
//  DefaultTags.swift
//  HabitOn
//
//  Created by Danil on 22.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import Foundation

typealias CompletionBlock = (_ success: Any?, _ error: Error?)->Void

struct DefaultTags {
    
    static let tags: [Tag]? = {
        let request = Tag.tagFetchRequest()
        let context = CoreDataManager().persistentContainer.viewContext
        do {
            let tags = try context.fetch(request)
            return tags
        } catch {
            beaverLog.error(error)
        }
        return nil
    }()
    
    static func updateTags(_ completion: @escaping CompletionBlock) {
        guard let path = Bundle.main.url(forResource: "Tags", withExtension: "plist") else { fatalError("failed to find file") }
        DispatchQueue.global().async {
            do {
                let jsonData = try Data(contentsOf: path)
                do {
                    if let json = try PropertyListSerialization.propertyList(from: jsonData, options: [], format: nil) as? [[String : Any]] {
                        Tag.createTag(from: json, completion: { (success, error) in
                            DispatchQueue.main.async {
                                completion(success, error)
                            }
                        })
                        beaverLog.debug(json)
                    }
                } catch {
                    beaverLog.error(error)
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            } catch{
                beaverLog.error(error)
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
}
