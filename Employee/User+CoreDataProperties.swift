//
//  User+CoreDataProperties.swift
//  Employee
//
//  Created by Nguyen Manh Quynh on 2/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userId: Int16
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var passport: Passport?
    @NSManaged public var task: NSSet?

}

// MARK: Generated accessors for task
extension User {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}
