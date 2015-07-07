//
//  AgricolaItemTests.swift
//  ScoreSheet2
//
//  Created by Chris Maki on 7/5/15.
//  Copyright (c) 2015 Chris Maki. All rights reserved.
//

import XCTest
import ScoreSheet2

class SplitTests : XCTestCase {
    var split: Split?
    
    override func setUp() {
        super.setUp()
        split = Split()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testScoringGame() {
        XCTAssertTrue(0 == split?.gameScore())

        split?.incrementCardsforRow(1)
        XCTAssertTrue(20 == split?.gameScore())
    }
    
    func testSampleGame() {
        // start with zero
        XCTAssertTrue(0 == split?.gameScore())
        
        split?.incrementCardsforRow(1)
        XCTAssertTrue(20 == split?.gameScore())

        split?.incrementNegative()
        XCTAssertTrue(15 == split?.gameScore())

        split?.incrementNegative()
        XCTAssertTrue(10 == split?.gameScore())

        split?.incrementNegative()
        XCTAssertTrue(5 == split?.gameScore())

        split?.incrementNegative()
        XCTAssertTrue(0 == split?.gameScore())

        split?.incrementNegative()
        XCTAssertTrue(-5 == split?.gameScore())

        split?.incrementNegative()
        split?.incrementNegative()
        split?.incrementNegative()
        split?.incrementNegative()
        XCTAssertTrue(-25 == split?.gameScore())
        
    }

    func testSampleGame2() {
        XCTAssertTrue(0 == split?.gameScore())

        split?.incrementCardsforRow(0) // 1 Ace - 30 total points
        split?.incrementCardsforRow(2) // 2 Queen - 50 total points
        split?.incrementCardsforRow(6) // 8 Queen - 60 total points
        split?.incrementCardsforRow(6) // 8 Queen - 80 total points

        XCTAssertTrue(80 == split?.gameScore())

        split?.incrementNegative()
        split?.incrementNegative()
        split?.incrementNegative()
        split?.incrementNegative()
        split?.incrementNegative()
        split?.incrementNegative() // total of -30

        XCTAssertTrue(50 == split?.gameScore())
    }

}

