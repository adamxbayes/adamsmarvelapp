//
//  CharacterDataContainer+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension CharacterDataContainer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterDataContainer> {
        return NSFetchRequest<CharacterDataContainer>(entityName: "CharacterDataContainer")
    }

    @NSManaged public var offset: Int64
    @NSManaged public var limit: Int64
    @NSManaged public var total: Int64
    @NSManaged public var count: Int64
    @NSManaged public var results: [Superhero]?

}

extension CharacterDataContainer : Identifiable {

}
