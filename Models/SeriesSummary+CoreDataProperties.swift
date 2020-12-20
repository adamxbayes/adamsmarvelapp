//
//  SeriesSummary+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension SeriesSummary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SeriesSummary> {
        return NSFetchRequest<SeriesSummary>(entityName: "SeriesSummary")
    }

    @NSManaged public var resourceURI: String?
    @NSManaged public var name: String?

}

extension SeriesSummary : Identifiable {

}
