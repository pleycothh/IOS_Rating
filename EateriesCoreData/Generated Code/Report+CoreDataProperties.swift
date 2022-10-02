//
//  Report+CoreDataProperties.swift
//  TheEateries
//
//  Created by Ben Li on 28/5/21.
//
//

import Foundation
import CoreData


extension Report {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Report> {
        return NSFetchRequest<Report>(entityName: "Report")
    }

    @NSManaged public var reportAuthor: String?
    @NSManaged public var reportContent: String?
    @NSManaged public var restaurants: Restaurant?

}

extension Report : Identifiable {

}
