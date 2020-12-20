//
//  Images+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension Images {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Images> {
        return NSFetchRequest<Images>(entityName: "Images")
    }

    @NSManaged public var path: String?
    @NSManaged public var imageExtension: String?

}

extension Images : Identifiable {

}
