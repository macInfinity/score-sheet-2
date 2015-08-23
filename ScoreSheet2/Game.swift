//
//  Game.swift
//  ScoreSheet2
//
//  Created by Chris Maki on 7/2/15.
//  Copyright (c) 2015 Chris Maki. All rights reserved.
//

import Foundation

public class Game {
    public var gameTitle: String
    public var gameDescription: String
    public var dateCreated = NSDate() // this is now
    // this is set by the player of the game, up to the UI for how to present this to the player
    public var message: String?

    // public for testing
    public var winner = false
    
    public init(gameTitle: String, gameDescription: String) {
        self.gameTitle = gameTitle
        self.gameDescription = gameDescription
    }
}