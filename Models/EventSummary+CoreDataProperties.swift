//
//  EventSummary+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension EventSummary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventSummary> {
        return NSFetchRequest<EventSummary>(entityName: "EventSummary")
    }

    @NSManaged public var resourceURI: String?
    @NSManaged public var name: String?

}

extension EventSummary : Identifiable {

}
