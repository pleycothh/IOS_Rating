//
//  Restaurant+CoreDataProperties.swift
//  TheEateries
//
//  Created by Ben Li on 28/5/21.
//
//

import Foundation
import CoreData


extension Restaurant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var note: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var locationName: String?
    @NSManaged public var longitudeSpan: Float
    @NSManaged public var latitudeSpan: Float
    @NSManaged public var inns: Inn?
    @NSManaged public var reports: NSOrderedSet?

}

// MARK: Generated accessors for reports
extension Restaurant {

    @objc(insertObject:inReportsAtIndex:)
    @NSManaged public func insertIntoReports(_ value: Report, at idx: Int)

    @objc(removeObjectFromReportsAtIndex:)
    @NSManaged public func removeFromReports(at idx: Int)

    @objc(insertReports:atIndexes:)
    @NSManaged public func insertIntoReports(_ values: [Report], at indexes: NSIndexSet)

    @objc(removeReportsAtIndexes:)
    @NSManaged public func removeFromReports(at indexes: NSIndexSet)

    @objc(replaceObjectInReportsAtIndex:withObject:)
    @NSManaged public func replaceReports(at idx: Int, with value: Report)

    @objc(replaceReportsAtIndexes:withReports:)
    @NSManaged public func replaceReports(at indexes: NSIndexSet, with values: [Report])

    @objc(addReportsObject:)
    @NSManaged public func addToReports(_ value: Report)

    @objc(removeReportsObject:)
    @NSManaged public func removeFromReports(_ value: Report)

    @objc(addReports:)
    @NSManaged public func addToReports(_ values: NSOrderedSet)

    @objc(removeReports:)
    @NSManaged public func removeFromReports(_ values: NSOrderedSet)

}

extension Restaurant : Identifiable {

}
