//
// Created by Chris Maki on 7/6/15.
// Copyright (c) 2015 Chris Maki. All rights reserved.
//

import Foundation

/**
This class can handle positive or negative values in a game of split.
 Everytime a player taps on a card, we update `cardsPlayed` and the score
 for a give row or `SplitItem` is just indexing into the array of `points`.

 Calculating the total game score is left to the class `Split`
*/
public class SplitItem {
    var title: String
    var points = [Int]()
    var cardsPlayed: Int?

    public init(title: String, points: [Int]) {
        self.title = title
        self.points = points
    }

    public var score: Int? {
        get {
            if let played = cardsPlayed {
                // we want to index into the array using a 1 based index because zero is 
                // stored at position 0 (zero), by fetching the value a 1, we get the first
                // non-zero value, exactly how Split is played on paper. Being off by 1 is 
                // exactly what we want here.
                return points.refOrLast(played)
            }
            return nil
        }
    }

    /**
    Increments the number of cards played for a given SplitItem.
    
    @return true if we've reached the maximum number of cards for this type
    
    @return false if we haven't reached the maximum number of cards for this type
    */
    public func incrementCardsPlayed() -> Bool {
        if let cards = cardsPlayed {
            if cards < points.count {
                cardsPlayed!++
            } else {
                // at this point, you've tried to add more cards than can be played
                return true
            }
        } else {
            cardsPlayed = 1
        }
        // we have not reached the end of cards to be played
        return false
    }

    /**
    Decrements the number of cards played for a given SplitItem.
    
    @return `true` if cards played were decremeneted (you have played at least one card)
    
    @return `false` if we cannot decrement you have not played at least one card
    */
    public func decrementCardsPlayed() -> Bool {
        if let cards = cardsPlayed {
            if cards > 0 {
                cardsPlayed!--
            } else {
                return false
            }
        }
        return true
    }


}
