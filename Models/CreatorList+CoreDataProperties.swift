//
//  CreatorList+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension CreatorList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreatorList> {
        return NSFetchRequest<CreatorList>(entityName: "CreatorList")
    }

    @NSManaged public var returned: String?
    @NSManaged public var collectionURI: String?
    @NSManaged public var items: [CreatorSummary]?
    @NSManaged public var available: String?

}

extension CreatorList : Identifiable {

}
