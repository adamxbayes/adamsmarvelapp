//
//  ComicPrice+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension ComicPrice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicPrice> {
        return NSFetchRequest<ComicPrice>(entityName: "ComicPrice")
    }

    @NSManaged public var type: String?
    @NSManaged public var price: Float

}

extension ComicPrice : Identifiable {

}
