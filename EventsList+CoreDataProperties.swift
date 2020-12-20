//
//  EventsList+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension EventsList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventsList> {
        return NSFetchRequest<EventsList>(entityName: "EventsList")
    }

    @NSManaged public var available: Int64
    @NSManaged public var returned: Int64
    @NSManaged public var collectionURI: String?
    @NSManaged public var items: [EventSummary]?

}

extension EventsList : Identifiable {

}
