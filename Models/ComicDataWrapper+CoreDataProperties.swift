//
//  ComicDataWrapper+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension ComicDataWrapper {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicDataWrapper> {
        return NSFetchRequest<ComicDataWrapper>(entityName: "ComicDataWrapper")
    }

    @NSManaged public var code: Int64
    @NSManaged public var status: String?
    @NSManaged public var copyright: String?
    @NSManaged public var attributionText: String?
    @NSManaged public var attributionHTML: String?
    @NSManaged public var data: ComicDataContainer?
    @NSManaged public var etag: String?

}

extension ComicDataWrapper : Identifiable {

}
