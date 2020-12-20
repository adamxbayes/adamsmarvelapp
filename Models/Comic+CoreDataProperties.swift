//
//  Comic+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData


extension Comic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comic> {
        return NSFetchRequest<Comic>(entityName: "Comic")
    }

    @NSManaged public var id: Int64
    @NSManaged public var digitalId: Int64
    @NSManaged public var title: String?
    @NSManaged public var issueNumber: Double
    @NSManaged public var variantDescription: String?
    @NSManaged public var descriptionLocal: String?
    @NSManaged public var modified: String?
    @NSManaged public var isbn: String?
    @NSManaged public var format: String?
    @NSManaged public var pageCount: Int64
    @NSManaged public var textObjects: [TextObject]?
    @NSManaged public var resourceURI: String?
    @NSManaged public var urls: [Url]?
    @NSManaged public var series: SeriesSummary?
    @NSManaged public var variants: [ComicSummary]?
    @NSManaged public var collectedIssues: [ComicSummary]?
    @NSManaged public var dates: [ComicDate]?
    @NSManaged public var prices: [ComicPrice]?
    @NSManaged public var thumbnail: Images?
    @NSManaged public var images: [Images]?
    @NSManaged public var creators: CreatorList?
    @NSManaged public var stories: StoryList?
    @NSManaged public var events: EventsList?

}

extension Comic : Identifiable {

}
