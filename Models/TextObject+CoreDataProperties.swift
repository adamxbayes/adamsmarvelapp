//
//  TextObject+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension TextObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TextObject> {
        return NSFetchRequest<TextObject>(entityName: "TextObject")
    }

    @NSManaged public var type: String?
    @NSManaged public var language: String?
    @NSManaged public var text: String?

}

extension TextObject : Identifiable {

}
