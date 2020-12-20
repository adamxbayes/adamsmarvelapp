//
//  CreatorSummary+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension CreatorSummary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreatorSummary> {
        return NSFetchRequest<CreatorSummary>(entityName: "CreatorSummary")
    }

    @NSManaged public var attribute: String?
    @NSManaged public var role: String?
    @NSManaged public var resourceURI: String?

}

extension CreatorSummary : Identifiable {

}
