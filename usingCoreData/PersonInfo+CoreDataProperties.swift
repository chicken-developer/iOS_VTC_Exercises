//
//  PersonInfo+CoreDataProperties.swift
//  usingCoreData
//
//  Created by Nguyen Manh Quynh on 1/15/20.
//  Copyright © 2020 Admin. All rights reserved.
//
//

import Foundation
import CoreData


extension PersonInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonInfo> {
        return NSFetchRequest<PersonInfo>(entityName: "PersonInfo")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var age: Int16

}
