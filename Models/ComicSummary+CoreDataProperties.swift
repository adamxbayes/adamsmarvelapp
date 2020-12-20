//
//  ComicSummary+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension ComicSummary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicSummary> {
        return NSFetchRequest<ComicSummary>(entityName: "ComicSummary")
    }

    @NSManaged public var resourceURI: String?
    @NSManaged public var name: String?

}

extension ComicSummary : Identifiable {

}
