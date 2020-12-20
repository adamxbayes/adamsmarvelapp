//
//  CharacterDataWrapper+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension CharacterDataWrapper {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterDataWrapper> {
        return NSFetchRequest<CharacterDataWrapper>(entityName: "CharacterDataWrapper")
    }

    @NSManaged public var code: Int64
    @NSManaged public var status: String?
    @NSManaged public var copyright: String?
    @NSManaged public var attributionText: String?
    @NSManaged public var data: CharacterDataContainer?
    @NSManaged public var etag: String?
    @NSManaged public var attributionHTML: String?

}

extension CharacterDataWrapper : Identifiable {

}
