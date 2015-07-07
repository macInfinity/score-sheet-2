//
//  AgricolaItemTests.swift
//  ScoreSheet2
//
//  Created by Chris Maki on 7/5/15.
//  Copyright (c) 2015 Chris Maki. All rights reserved.
//

import XCTest
import ScoreSheet2

class GameTests : XCTestCase {
    var game: Game?
    
    override func setUp() {
        super.setUp()
        game = Game(gameTitle: "foo", gameDescription: "this is the description")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testGameSetup() {
        XCTAssertFalse(game!.winner)
        XCTAssertNotNil(game?.gameTitle)
        XCTAssertNotNil(game?.dateCreated)
        XCTAssertNotNil(game?.gameDescription)
    }
    
    func testWinner() {
        game!.winner = true
        XCTAssertTrue(game!.winner)
    }
    
    
}

