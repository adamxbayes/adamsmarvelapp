//
//  StoryList+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension StoryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoryList> {
        return NSFetchRequest<StoryList>(entityName: "StoryList")
    }

    @NSManaged public var available: Int64
    @NSManaged public var returned: Int64
    @NSManaged public var collectionURI: String?
    @NSManaged public var items: [StorySummary]?

}

extension StoryList : Identifiable {

}
