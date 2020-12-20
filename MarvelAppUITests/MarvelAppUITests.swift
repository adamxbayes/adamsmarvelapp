//
//  MarvelAppUITests.swift
//  MarvelAppUITests
//
//  Created by Adam Bayes on 01/10/2020.
//

import XCTest

class MarvelAppUITests: XCTestCase {
    let app = XCUIApplication()
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        self.app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testViewSuperheroDetailsNavigation(){
        self.app.launch()
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
       
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Absorbing Man"]/*[[".cells.staticTexts[\"Absorbing Man\"]",".staticTexts[\"Absorbing Man\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["View"]/*[[".cells.buttons[\"View\"]",".buttons[\"View\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["MarvelApp.FindSuperHeroView"].buttons["Back"].tap()
    }
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
                            }
        }
    }
}
