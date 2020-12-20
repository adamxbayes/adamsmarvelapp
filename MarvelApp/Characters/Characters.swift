//
//  Characters.swift
//  MarvelApp
//
//  Created by Adam Bayes on 01/10/2020.
//

import Foundation

    enum CharacterDataWrapperKeys: String, CodingKey {
        case code, status, copyright, attributionText, attributionHTML, data, etag
    }
    
   public struct CharacterDataWrapper: Decodable {
        var code: Int?
        var status: String?
        var copyright: String?
        var attributionText: String?
        var attributionHTML: String?
        var data: CharacterDataContainer?
        var etag: String?
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CharacterDataWrapperKeys.self)
            
            self.code = try container.decode(Int.self, forKey: .code)
            self.status = try container.decode(String.self, forKey: .status)
            self.copyright = try container.decode(String.self, forKey: .copyright)
            self.attributionText = try container.decode(String.self, forKey: .attributionText)
            self.attributionHTML = try container.decode(String.self, forKey: .attributionHTML)
            self.data = try container.decode(CharacterDataContainer.self, forKey: .data)
        }
        
    }

public struct CharacterDataContainer: Decodable {
        
        var offset: Int?
        var limit: Int?
        var total: Int?
        var count: Int?
        var results: [Superhero]
    }
    
    enum SuperheroKeys: String, CodingKey {
        case id, name, description, modified, resourceURI, urls, comics, stories, eventList
    }

    public struct Superhero: Codable {
        var id: Int?
        var name: String?
        var description: String?
        var modified: String?
        var resourceURI: String?
        var urls: [Url]?
        var comics: ComicList?
        var stories: StoryList?
        var eventList: SeriesList?
        
       public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: SuperheroKeys.self)
            
            self.id = try container.decode(Int.self, forKey: .id)
            self.name = try container.decode(String.self, forKey: .name)
            self.description = try container.decode(String.self, forKey: .description)
            self.modified = try container.decode(String.self, forKey: .modified)
            self.comics = try container.decode(ComicList.self, forKey: .comics)
            self.stories = try container.decode(StoryList.self, forKey: .stories)
        }
        
       public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: SuperheroKeys.self)
            
            try container.encode(id, forKey: .id)
            try container.encode(name, forKey: .name)
            try container.encode(description, forKey: .description)
            try container.encode(modified, forKey: .modified)
          
        }
    }

struct Url: Decodable {
        var type: String?
        var url: String?
    }

struct ComicList: Decodable {
        var available: Int?
        var returned: Int?
        var collectionURI: String?
        var items: [ComicSummary]?
    }

struct ComicSummary: Decodable {
        var resourceURI: String?
        var name: String?
    }

struct StoryList: Decodable {
        var available: Int?
        var returned: Int?
        var collectionURI: String?
        var items: [StorySummary]
    }

struct StorySummary: Decodable {
        var resourceURI: String?
        var name: String?
        var type: String?
    }

struct EventList: Decodable {
        var available: Int?
        var returned: Int?
        var collecitonURI: String?
        var items: [EventSummary]?
    }

struct EventSummary: Decodable {
        var resourceURI: String?
        var name: String?
    }

struct SeriesList: Decodable {
        var available: Int?
        var returned: Int?
        var collectionURI: String?
        var items: [SeriesSummary]?
    }

struct SeriesSummary: Decodable {
        var resourceURI: String?
        var name: String?
    }


    




