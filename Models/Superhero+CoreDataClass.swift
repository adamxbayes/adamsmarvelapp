//
//  Superhero+CoreDataClass.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData

@objc(Superhero)
public class Superhero: NSManagedObject, Decodable {
    
   required public init(from decoder: Decoder) throws {
               let container = try decoder.container(keyedBy: SuperheroKeys.self)
   
                self.id = Int64(try container.decode(Int.self, forKey: .id))
               self.name = try container.decode(String.self, forKey: .name)
               self.descriptionLocal = try container.decode(String.self, forKey: .descriptionLocal)
               self.modified = try container.decode(String.self, forKey: .modified)
               self.comics = try container.decode(ComicList.self, forKey: .comics)
               self.stories = try container.decode(StoryList.self, forKey: .stories)
           }
}


enum SuperheroKeys: String, CodingKey {
        case id, name, descriptionLocal, modified, resourceURI, urls, comics, stories, eventList
    }
