//
//  Superhero+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension Superhero {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Superhero> {
        return NSFetchRequest<Superhero>(entityName: "Superhero")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var modified: String?
    @NSManaged public var descriptionLocal: String?
    @NSManaged public var resourceURI: String?
    @NSManaged public var urls: [Url]?
    @NSManaged public var comics: ComicList?
    @NSManaged public var stories: StoryList?
    @NSManaged public var eventList: SeriesList?

}

extension Superhero : Identifiable {

}
