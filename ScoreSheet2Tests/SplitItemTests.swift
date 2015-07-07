//
//  AgricolaItemTests.swift
//  ScoreSheet2
//
//  Created by Chris Maki on 7/5/15.
//  Copyright (c) 2015 Chris Maki. All rights reserved.
//

import XCTest
import ScoreSheet2

class SplitItemTests : XCTestCase {
    var splitItem: SplitItem?
    
    override func setUp() {
        super.setUp()
        splitItem = SplitItem(title: "2", points: [0, 5, 20, 40, 70, 200])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testIncrement() {
        splitItem?.incrementCardsPlayed()
        XCTAssertTrue(5 == splitItem?.score)

        splitItem?.incrementCardsPlayed()
        XCTAssertTrue(20 == splitItem?.score)

        splitItem?.incrementCardsPlayed()
        XCTAssertTrue(40 == splitItem?.score)

        splitItem?.incrementCardsPlayed()
        XCTAssertTrue(70 == splitItem?.score)

        splitItem?.incrementCardsPlayed()
        XCTAssertTrue(200 == splitItem?.score)

        splitItem?.incrementCardsPlayed()
        XCTAssertTrue(200 == splitItem?.score)

    }
    
    func testDecrement() {
        splitItem?.incrementCardsPlayed()
        splitItem?.incrementCardsPlayed()
        splitItem?.incrementCardsPlayed()
        splitItem?.incrementCardsPlayed()
        splitItem?.incrementCardsPlayed()
        // make sure we are at the max
        XCTAssertTrue(200 == splitItem?.score)
        
        splitItem?.decrementCardsPlayed()
        XCTAssertTrue(70 == splitItem?.score)

        splitItem?.decrementCardsPlayed()
        XCTAssertTrue(40 == splitItem?.score)

        splitItem?.decrementCardsPlayed()
        XCTAssertTrue(20 == splitItem?.score)

        splitItem?.decrementCardsPlayed()
        XCTAssertTrue(5 == splitItem?.score)

        splitItem?.decrementCardsPlayed()
        XCTAssertTrue(0 == splitItem?.score)

        splitItem?.decrementCardsPlayed()
        XCTAssertTrue(0 == splitItem?.score)
        println("score is: \(splitItem?.score)")

    }
}

