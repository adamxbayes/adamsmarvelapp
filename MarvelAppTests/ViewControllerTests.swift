//
//  ViewControllerTests.swift
//  MarvelAppTests
//
//  Created by Adam Bayes on 07/10/2020.
//

import XCTest
@testable import MarvelApp

class ViewControllerTests: XCTestCase {
    var viewController: CharactersViewController!
    override func setUp() {
        self.viewController = CharactersViewController()
    }
    override func tearDown() {
        self.viewController = nil
    }
    
    func testGetSuperheroes() {
     
        let dataService = DataService(session: MockNetworkSession())
        let exp = expectation(description: "That we get a superhero")
        dataService.getCharacters(url: URL(string: "character")!) {
            (result: Result<CharacterDataWrapper, Error>) in
            
            switch result {
            case .success(let resp): do {
                print(resp)
                exp.fulfill()
                XCTAssertGreaterThan(resp.data?.results.count as! Int, 5)
                XCTAssertEqual(resp.data?.results[0].name, "3-D Man")
            }
            case .failure(let err): do {
                XCTAssertNil(err)
            }
            }
            
        }
        wait(for: [exp], timeout: 4.0)
    }

}
