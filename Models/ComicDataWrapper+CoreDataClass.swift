//
//  ComicDataWrapper+CoreDataClass.swift
//  MarvelApp
//
//  Created by Adam Bayes on 20/12/2020.
//
//

import Foundation
import CoreData

@objc(ComicDataWrapper)
public class ComicDataWrapper: NSManagedObject, Decodable {
    required public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: ComicDataWrapperKeys.self)
            self.code = Int64(try container.decode(Int.self, forKey: .code))
            self.status = try container.decode(String.self, forKey: .status)
            self.copyright = try container.decode(String.self, forKey: .copyright)
            self.attributionText = try container.decode(String.self, forKey: .attributionText)
            self.attributionHTML = try container.decode(String.self, forKey: .attributionHTML)
            self.data = try container.decode(ComicDataContainer.self, forKey: .data)
            self.etag = try container.decode(String.self, forKey: .etag)
        }

}
enum ComicDataWrapperKeys: String, CodingKey {
    case code, status, copyright, attributionText, attributionHTML, data, etag
}
