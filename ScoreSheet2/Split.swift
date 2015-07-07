//
// Created by Chris Maki on 7/3/15.
// Copyright (c) 2015 Chris Maki. All rights reserved.
//

import Foundation

public class Split : Game {
    private var splitRows = [SplitItem]()
    private var negative: SplitItem
    
    public init() {
        splitRows.append(SplitItem(title: "A", points: [0, 30, 70, 120, 180, 200]))
        splitRows.append(SplitItem(title: "K", points: [0, 20, 50, 90, 140, 200]))
        splitRows.append(SplitItem(title: "Q", points: [0, 20, 50, 90, 140, 200]))
        splitRows.append(SplitItem(title: "J", points: [0, 20, 50, 90, 140, 200]))
        splitRows.append(SplitItem(title: "10", points: [0, 10, 30, 60, 100, 200]))
        splitRows.append(SplitItem(title: "9", points: [0, 10, 30, 60, 100, 200]))
        splitRows.append(SplitItem(title: "8", points: [0, 10, 30, 120, 100, 200]))
        splitRows.append(SplitItem(title: "7", points: [0, 10, 30, 120, 100, 200]))
        splitRows.append(SplitItem(title: "6", points: [0, 10, 30, 120, 100, 200]))
        splitRows.append(SplitItem(title: "5", points: [0, 10, 30, 120, 100, 200]))
        splitRows.append(SplitItem(title: "4", points: [0, 10, 30, 120, 100, 200]))
        splitRows.append(SplitItem(title: "3", points: [0, 10, 30, 120, 100, 200]))
        splitRows.append(SplitItem(title: "2", points: [0, 5, 20, 40, 70, 200]))

        negative = SplitItem(title: "-ve", points: [0, -5, -10, -15, -20, -25, -30, -35,
                                                    -40, -45, -50, -55, -60, -65, -70, -75,
                                                    -80, -85, -90, -95, -100, -105, -110, -115,
                                                    -120, -125, -130, -135, -140, -145, -150,
                                                    -155, -160, -165, -170, -175, -180, -185,
                                                    -190, -195, -200])

        super.init(gameTitle: "Split", gameDescription:
            "The goal is to garner the most points by collecting perfect, strong, and weak matches. " +
                "When a match is made, the player gets a special action, depending on the match. " +
                "Perfect matches allow the player to force another player to fill in a negative box " +
                "on his scoresheet, strong matches allow the player to draw a card from the draw pile, " +
                "and weak matches allow the player to exchange matches of the same type. More than " +
                "one match may be made each turn and a special scoresheet (this app) is used to keep " +
            "track of points.")

    }


    public func gameScore() -> Int? {
        // collect all card values
        let score = splitRows.reduce(0) {
            if let i = $1.score {
                // return from closure
                return $0 + i
            }
            // return from closure
            return $0
        }
        
        var result = score
        
        // if we have any -ve values, subtract that from result
        if let neg = negative.score {
            // since -ve values are stored, we can add the -ve number (in effect subtracting the value)
            result = score + neg
        }
        
        return result
    }
    
    // rows start at zero, just like any normal array
    public func incrementCardsforRow(row: Int) -> Bool? {
        return splitRows.ref(row)?.incrementCardsPlayed()
    }
    
    // rows start at zero, just like any normal array
    public func decrementCardsForRow(row: Int) -> Bool? {
        return splitRows.ref(row)?.decrementCardsPlayed()
    }
    
    public func incrementNegative() -> Bool {
        return negative.incrementCardsPlayed()
    }

    public func decrementNegative() -> Bool {
        return negative.decrementCardsPlayed()
    }
}
