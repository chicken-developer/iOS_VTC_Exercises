//
//  Task+CoreDataProperties.swift
//  Employee
//
//  Created by Nguyen Manh Quynh on 2/26/20.
//  Copyright © 2020 Admin. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var taskID: Int16
    @NSManaged public var taskName: String?
    @NSManaged public var taskDetail: String?
    @NSManaged public var ofUser: User?

}
