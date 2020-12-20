//
//  ComicDate+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension ComicDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicDate> {
        return NSFetchRequest<ComicDate>(entityName: "ComicDate")
    }

    @NSManaged public var type: String?
    @NSManaged public var date: String?

}

extension ComicDate : Identifiable {

}
