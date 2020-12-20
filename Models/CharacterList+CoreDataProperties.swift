//
//  CharacterList+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension CharacterList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterList> {
        return NSFetchRequest<CharacterList>(entityName: "CharacterList")
    }

    @NSManaged public var available: String?
    @NSManaged public var returned: String?
    @NSManaged public var collectionURI: String?
    @NSManaged public var items: NSObject?

}

extension CharacterList : Identifiable {

}
