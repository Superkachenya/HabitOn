//
//  TagParser.swift
//  HabitOn
//
//  Created by Danil on 27.05.17.
//  Copyright © 2017 danielvoitenkoapps. All rights reserved.
//

import Foundation
import CoreData

extension Tag {
    
    class func tagFetchRequest() -> NSFetchRequest <Tag> {
        return NSFetchRequest(entityName: String(describing: self))
    }
    
    class func createTag(from content:[[String:Any]], completion: CompletionBlock) {
        
        let context = CoreDataManager().persistentContainer.newBackgroundContext()
        
        for dict in content {
            if let tag = Tag.findFirstOrCreate(in: context, tagId: dict["tagId"] as! Int64) {
                tag.parseAndSave(with: dict)
            }
        }
        context.performAndWait {
            try? context.save()
        }
        completion(true, nil)
    }
    
    private class func findFirstOrCreate(in context: NSManagedObjectContext, tagId: Int64) -> Tag? {
        let request = Tag.tagFetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate.init(format: "tagId == %d", tagId)
        do {
            var tag = try context.fetch(request).first
            if tag == nil {
                tag = NSEntityDescription.insertNewObject(forEntityName: String(describing: self), into: context) as? Tag
            }
            return tag
        } catch {
            beaverLog.error(error)
        }
        return nil
    }
    
    private func parseAndSave(with content: [String:Any]) {
        self.color = content["color"] as? String
        self.tagId = content["tagId"] as! Int64
        self.title = content["title"] as? String
    }
}
