//
//  ViewControllerTests.swift
//  MarvelAppTests
//
//  Created by Adam Bayes on 06/10/2020.
//



import XCTest

@testable import MarvelApp

class FindSuperheroViewControllerTests: XCTestCase {
    

    var viewController: FindSuperHeroViewController!

    override func setUp(){
        viewController = FindSuperHeroViewController()
        viewController.heroSelected = 1
    }
    
    func testGetSuperhero(){
        let dataService = DataService.init(session: MockNetworkSession(), resourcePath: "character/1")
        dataService.getSuperHero(url: URL(string: "character/1")!) {
            (result: Result<CharacterDataWrapper, Error>) in
            
            switch result {
            case .success(let resp): do {
                print(resp)
            }
            case .failure(let err): do {
                print(err)
                XCTAssertNil(err)
            }
            }
        }
    }

    override func tearDown(){
        viewController = nil
    }

}
