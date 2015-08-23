//
//  AgricolaItemTests.swift
//  ScoreSheet2
//
//  Created by Chris Maki on 7/5/15.
//  Copyright (c) 2015 Chris Maki. All rights reserved.
//

import XCTest
import ScoreSheet2

class AgricolaItemTests : XCTestCase {
    var agricolaItem: AgricolaItem?
    var agricolaItemMultiplier: AgricolaItem?
    
    override func setUp() {
        super.setUp()
        agricolaItem = AgricolaItem(title: "Fields", multipleValues: [-1, -1, 1, 2, 3, 4])
        agricolaItemMultiplier = AgricolaItem(title: "Fields", multiplier: 3)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }

    func testFields() {
       agricolaItem?.userInput = 3
       XCTAssertTrue(1 == agricolaItem?.score)

    }

    func testMultiplier() {
        agricolaItemMultiplier?.userInput = 3
        XCTAssertTrue(9 == agricolaItemMultiplier?.score)
        
        agricolaItemMultiplier?.userInput = 1
        XCTAssertTrue(3 == agricolaItemMultiplier?.score)
        
        agricolaItemMultiplier?.userInput = 6
        XCTAssertTrue(18 == agricolaItemMultiplier?.score)
    }
    
    func testMultipleValues() {
        agricolaItem?.userInput = 1
        XCTAssertTrue(-1 == agricolaItem?.score)
        
        agricolaItem?.userInput = 2
        XCTAssertTrue(-1 == agricolaItem?.score)
        
        agricolaItem?.userInput = 3
        XCTAssertTrue(1 == agricolaItem?.score)
        
        agricolaItem?.userInput = 4
        XCTAssertTrue(2 == agricolaItem?.score)
        
        agricolaItem?.userInput = 5
        XCTAssertTrue(3 == agricolaItem?.score)
        
        agricolaItem?.userInput = 6
        XCTAssertTrue(4 == agricolaItem?.score)
        
        agricolaItem?.userInput = 7
        XCTAssertTrue(4 == agricolaItem?.score)
        
        agricolaItem?.userInput = 0
        XCTAssertNil(agricolaItem?.score)
    }
    
    func testNoInput() {
        if let score = agricolaItem?.score {
            XCTFail("score should have been nil")
        }
    }
    
    func testBoundaries() {
        agricolaItem?.userInput = 5
        println("score is: \(agricolaItem?.score)")
        XCTAssertTrue(3 == agricolaItem?.score)
        
        agricolaItem?.userInput = 6
        XCTAssertTrue(4 == agricolaItem?.score)
        
        agricolaItem?.userInput = 7
        XCTAssertTrue(4 == agricolaItem?.score)
        
        agricolaItem?.userInput = 1
        XCTAssertTrue(-1 == agricolaItem?.score)
        
        agricolaItem?.userInput = 0
        XCTAssertNil(agricolaItem?.score)
    }
}

