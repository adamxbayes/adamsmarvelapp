//
//  MockNetwork.swift
//  MarvelAppTests
//
//  Created by Adam Bayes on 06/10/2020.
//

import XCTest
import Foundation
@testable import MarvelApp
public class MockNetworkSession: NetworkSession {
    
    public func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> NetworkTask {
        let bundle = Bundle.init(for: type(of: self))
        guard let url = bundle.url(forResource: url.absoluteString, withExtension: "json") else {
            XCTFail("could not find json for url provided.")
            return MockNetworkTask()
        }
        let json = try! Data(contentsOf: url)
        completion(json, nil, nil)
        return MockNetworkTask()
    }
    
}
class MockNetworkTask: NetworkTask {
  func resume() {
}
}
