//
//  Url+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension Url {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Url> {
        return NSFetchRequest<Url>(entityName: "Url")
    }

    @NSManaged public var type: String?
    @NSManaged public var url: String?

}

extension Url : Identifiable {

}
