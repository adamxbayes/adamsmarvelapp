//
//  Comics.swift
//  MarvelApp
//
//  Created by Adam Bayes on 09/10/2020.
//

import Foundation


//enum ComicDataWrapperKeys: String, CodingKey {
//    case code, status, copyright, attributionText, attributionHTML, data, etag
//}

//public struct ComicDataWrapper: Decodable {
//    var code: Int?
//    var status: String?
//    var copyright: String?
//    var attributionText: String?
//    var attributionHTML: String?
//    var data: ComicDataContainer?
//    var etag: String?
//
//    public init(from decoder: Decoder) throws {
//
//        let container = try decoder.container(keyedBy: ComicDataWrapperKeys.self)
//
//        self.code = try container.decode(Int.self, forKey: .code)
//        self.status = try container.decode(String.self, forKey: .status)
//        self.copyright = try container.decode(String.self, forKey: .copyright)
//        self.attributionText = try container.decode(String.self, forKey: .attributionText)
//        self.attributionHTML = try container.decode(String.self, forKey: .attributionHTML)
//        self.data = try container.decode(ComicDataContainer.self, forKey: .data)
//    }
//}
    
//    public struct ComicDataContainer: Decodable {
//        var offset: Int?
//        var limit: Int?
//        var total: Int?
//        var count: Int?
//        var results: [Comic]?
//    }
    
//    enum ComicKeys: String, CodingKey {
//        case id, digitalId, title, issueNumber, variantDescription, description, modified, isbn, upc, diamondCode, ean, issn, format, pageCount, textObjects,resourceURI, urls, series, variants, collections, collectedIssues, dates, prices, thumbnail, images, creators, characters, stories, events
//    }
//
//    public struct Comic: Codable {
//        var id: Int?
//        var digitalId: Int?
//        var title: String?
//        var issueNumber: Double?
//        var variantDescription: String?
//        var description: String?
//        var modified: String?
//        var isbn: String?
//        var upc: String?
//        var diamondCode: String?
//        var ean: String?
//        var issn: String?
//        var format: String?
//        var pageCount: Int?
//        var textObjects: [TextObject]?
//        var resourceURI: String?
//        var urls: [Url]?
//        var series: SeriesSummary?
//        var variants: [ComicSummary]?
//        var collections: [ComicSummary]?
//        var collectedIssues: [ComicSummary]?
//        var dates: [ComicDate]?
//        var prices: [ComicPrice]?
//        var thumbnail: Image?
//        var images: [Image]?
//        var creators: CreatorList?
//        var stories: StoryList?
//        var events: EventList?
//
//        public init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: ComicKeys.self)
//
//            self.id = try container.decode(Int.self, forKey: .id)
//            self.digitalId = try container.decode(Int.self, forKey: .digitalId)
//            self.title = try container.decode(String.self, forKey: .title)
//            self.issueNumber = try container.decode(Double.self, forKey: .issueNumber)
//            self.variantDescription = try container.decode(String.self, forKey: .variantDescription)
//            self.description = try container.decode(String.self, forKey: .description)
//            self.modified = try container.decode(String.self, forKey: .modified)
//            self.isbn = try container.decode(String.self, forKey: .isbn)
//            self.upc = try container.decode(String.self, forKey: .upc)
//            self.diamondCode = try container.decode(String.self, forKey: .diamondCode)
//            self.ean = try container.decode(String.self, forKey: .ean)
//            self.issn = try container.decode(String.self, forKey: .issn)
//            self.format = try container.decode(String.self, forKey: .format)
//            self.pageCount = try container.decode(Int.self, forKey: .pageCount)
//            self.textObjects = try container.decode([TextObject].self, forKey: .textObjects)
//            self.resourceURI = try container.decode(String.self, forKey: .resourceURI)
//            self.urls = try container.decode([Url].self, forKey: .urls)
//            self.series = try container.decode(SeriesSummary.self, forKey: .series)
//            self.variants = try container.decode([ComicSummary].self, forKey: .variants)
//            self.collectedIssues = try container.decode([ComicSummary].self, forKey: .collectedIssues)
//            self.dates = try container.decode([ComicDate].self, forKey: .dates)
//            self.prices = try container.decode([ComicPrice].self, forKey: .prices)
//            self.thumbnail = try container.decode(Image.self, forKey: .thumbnail)
//            self.images = try container.decode([Image].self, forKey: .images)
//            self.creators = try container.decode(CreatorList.self, forKey: .creators)
//            self.stories = try container.decode(StoryList.self, forKey: .stories)
//            self.events = try container.decode(EventList.self, forKey: .events)
//        }
//
//        public func encode(to encoder: Encoder) throws {
//
//        }
//    }
    
//     struct TextObject : Decodable {
//        var type: String?
//        var language: String?
//        var text: String?
//    }
    
//    struct ComicDate : Decodable {
//        var type: String?
//        var date: String?
//    }
////
//    struct ComicPrice: Decodable {
//        var type: String?
//        var price: Float?
//    }
//
//    struct Image : Decodable {
//        var path: String?
//        var `extension`: String?
//
//        public mutating func buildUrl() -> String {
//            return ""
//        }
//    }
    
//    struct CreatorList : Decodable {
//        var available : Int?
//        var returned : Int?
//        var collectionURI : String?
//        var items : [CreatorSummary]?
//    }
    
//    struct CreatorSummary : Decodable {
//        var resourceURI: String?
//        var name: String?
//        var role: String?
//    }
    
//    struct CharacterList : Decodable {
//        var available: Int?
//        var returned: Int?
//        var collectionURI: String?
//        var items: [CharacterSummary]?
//    }
//
//    struct CharacterSummary : Decodable  {
//        var resourceURI: String?
//        var name: String?
//        var role: String?
//    }
//
//    struct StoryList : Decodable {
//        var available: Int?
//        var returned: Int?
//        var collectionURI: String?
//        var items: [StorySummary]?
//    }
//
//    struct EventList : Decodable {
//        var available: Int?
//        var returned: Int?
//        var collectionURI: String?
//        var items: [EventSummary]?
//    }


