//
//  ComicList+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension ComicList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicList> {
        return NSFetchRequest<ComicList>(entityName: "ComicList")
    }

    @NSManaged public var available: Int64
    @NSManaged public var returned: Int64
    @NSManaged public var collectionURI: String?
    @NSManaged public var items: [ComicSummary]?

}

extension ComicList : Identifiable {

}
