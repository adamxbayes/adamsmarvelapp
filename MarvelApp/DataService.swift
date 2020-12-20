//
//  DataService.swift
//  MarvelApp
//
//  Created by Adam Bayes on 01/10/2020.
//

import Foundation
import CryptoKit

protocol NetworkTask {
  func resume()
}

extension URLSessionDataTask: NetworkTask {}

protocol NetworkSession {
    func dataTask(with: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask
}

extension URLSession: NetworkSession {
  func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask {
    return dataTask(with:url, completionHandler: completion)
  }
}

class DataService {
public let session: NetworkSession
    var resourceURL: URL
    
    convenience init(session: NetworkSession) {
      self.init(session: session, resourcePath: nil)
    }
    
    init(session: NetworkSession, resourcePath: String?) {
      self.session = session

        guard let resourceURL = URL(string: self.baseUrl) else {
        fatalError()
      }
      if let resourcePath = resourcePath {
        self.resourceURL = resourceURL.appendingPathComponent(resourcePath)
      } else {
        self.resourceURL = resourceURL
      }
    }
    
let baseUrl = "http://gateway.marvel.com"
let version = "v1/public"
let publicKey = "48cc1bb2b76e26f04569c3131d6fb604"
let privateKey = "79825ce54a071c66fe8fdecdad88119a9e7efc36"
var url: URL?
var ts = NSDate().timeIntervalSince1970
var path: String? {
      didSet {
        if let path = path, let url = URL(string: baseUrl)?.appendingPathComponent(path) {
          resourceURL = url
        }
      }
    }


func MD5(string: String) -> String {
    let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
}

public func buildUrl(path: String) -> String {

    let path = path
    let preHashedString = "\(ts)\(privateKey)\(publicKey)"
    let hashedString = MD5(string: preHashedString)
//    let mergedUrl = "\(self.baseUrl)/\(self.version)/\(path)?ts=\(ts)&limit=\(limit)&apikey=\(publicKey)&hash=\(hashedString)"
    let mergedUrl = "\(self.baseUrl)/\(self.version)/\(path)?ts=\(ts)&apikey=\(publicKey)&hash=\(hashedString)"
    return mergedUrl
}

func getCharacters(url: URL, completion: @escaping (Result<CharacterDataWrapper, Error>) -> Void) {
    let task = session.dataTask(with: url) { (data, response, error) in
    if let httpResponse = response as? HTTPURLResponse {
            print("API status for getCharacters is : \(httpResponse.statusCode)")
    }
    guard let validData = data, error == nil else {
        completion(.failure(error!))
            return
        }
        
    do {
            // let json = try JSONSerialization.jsonObject(with: validData, options:[])
            let characters = try JSONDecoder().decode(CharacterDataWrapper.self, from: validData)
            completion(.success(characters))
        } catch let serializationError {
            completion(.failure(serializationError))
        }
    }
    task.resume()
}
    
    func getSuperHero(url: URL, completion: @escaping (Result<CharacterDataWrapper, Error>) -> Void) {
        let task = session.dataTask(with: url) {(data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("getSuperHero API status is : \(httpResponse.statusCode)")
            }
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                let hero = try JSONDecoder().decode(CharacterDataWrapper.self, from: validData)
                completion(.success(hero))
            } catch let serializationError {
                completion(.failure(serializationError))
                print("Could not deserialize getSuperhero")
            }
        }
        task.resume()
    }
    
    func getComicsBySuperheroId(url:URL, completion: @escaping (Result<ComicDataWrapper, Error>) -> Void) {
        let task = session.dataTask(with: url) {(data, response, error) in
                        
            if let httpResponse = response as?
                HTTPURLResponse {
                print("Api Status for getComicsBySuperheroId is : \(httpResponse.statusCode)")
            }
                        
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
        
            do {
                if let comics = try? JSONDecoder().decode(ComicDataWrapper.self, from: validData) {
                    completion(.success(comics))
                }
            } catch let serializationError {
                completion(.failure(serializationError))
                print("Could not deserialize getComicsBySuperheroId")
            }
    }
    task.resume()
    }
}
