//
//  SeriesList+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension SeriesList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SeriesList> {
        return NSFetchRequest<SeriesList>(entityName: "SeriesList")
    }

    @NSManaged public var available: String?
    @NSManaged public var returned: Int64
    @NSManaged public var collectionURI: String?
    @NSManaged public var items: [SeriesSummary]?

}

extension SeriesList : Identifiable {

}
