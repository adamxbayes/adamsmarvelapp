//
//  CharacterSummary+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension CharacterSummary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterSummary> {
        return NSFetchRequest<CharacterSummary>(entityName: "CharacterSummary")
    }

    @NSManaged public var resourceURI: String?
    @NSManaged public var name: String?
    @NSManaged public var role: String?

}

extension CharacterSummary : Identifiable {

}
