//
//  AgricolaItemTests.swift
//  ScoreSheet2
//
//  Created by Chris Maki on 7/5/15.
//  Copyright (c) 2015 Chris Maki. All rights reserved.
//

import XCTest
import ScoreSheet2

class AgricolaTests : XCTestCase {
    var agricola: Agricola?
    
    override func setUp() {
        super.setUp()
        agricola = Agricola()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testScoringGame() {
        XCTAssertTrue(0 == agricola?.gameScore())

        agricola?.updateScore(1, line: 1)
        XCTAssertTrue(-1 == agricola?.gameScore())
        XCTAssertTrue(-1 == agricola?.scoreForLine(1))


        agricola?.updateScore(3, line: 1)
        XCTAssertTrue(2 == agricola?.gameScore())
        XCTAssertTrue(2 == agricola?.scoreForLine(1))

        agricola?.updateScore(6, line: 0)
        
        // 4 points for "Fields" and 2 points for "Pastures" above
        XCTAssertTrue(6 == agricola?.gameScore())
        
        // make sure "Pastures" value has not been changed
        XCTAssertTrue(2 == agricola?.scoreForLine(1))
        
        // check value of "Fields" as well
        XCTAssertTrue(4     == agricola?.scoreForLine(0))
    }

    func testTitles() {
        XCTAssertTrue("Fields" == agricola?.titleForLine(0))
    }
    
    func testRowCount() {
        var count = agricola?.numberOfItems()
        XCTAssertTrue(15 == count!)
    }
}

