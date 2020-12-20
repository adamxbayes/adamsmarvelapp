//
//  StorySummary+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension StorySummary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StorySummary> {
        return NSFetchRequest<StorySummary>(entityName: "StorySummary")
    }

    @NSManaged public var resourceURI: String?
    @NSManaged public var name: String?
    @NSManaged public var type: String?

}

extension StorySummary : Identifiable {

}
