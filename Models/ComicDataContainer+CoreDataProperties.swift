//
//  ComicDataContainer+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension ComicDataContainer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicDataContainer> {
        return NSFetchRequest<ComicDataContainer>(entityName: "ComicDataContainer")
    }

    @NSManaged public var offset: Int64
    @NSManaged public var limit: Int64
    @NSManaged public var total: Int64
    @NSManaged public var count: Int64
    @NSManaged public var results: [Comic]?

}

extension ComicDataContainer : Identifiable {

}
