//
// Created by Chris Maki on 7/3/15.
// Copyright (c) 2015 Chris Maki. All rights reserved.
// Implementation of the Agricola Board Game score sheet
//

import Foundation

public class Agricola : Game {
    private var gameItems = [AgricolaItem]()

    public init() {        
        gameItems.append(AgricolaItem(title: "Fields", multipleValues: [-1, -1, 1, 2, 3, 4]))
        gameItems.append(AgricolaItem(title: "Pastures", multipleValues: [-1, 1, 2, 3, 4]))
        gameItems.append(AgricolaItem(title: "Grain", multipleValues: [-1, 1, 1, 1, 2, 2, 3, 3, 4]))
        gameItems.append(AgricolaItem(title: "Vegetables", multipleValues: [-1, 1, 2, 3, 4]))
        gameItems.append(AgricolaItem(title: "Sheep", multipleValues: [-1, 1, 1, 1, 2, 2, 3, 3, 4]))
        gameItems.append(AgricolaItem(title: "Wild Boar", multipleValues: [-1, 1, 1, 2, 2, 3, 3, 4]))
        gameItems.append(AgricolaItem(title: "Cattle", multipleValues: [-1, 1, 2, 2, 3, 3, 4]))
        gameItems.append(AgricolaItem(title: "Unused spaces", multiplier: -1))    
        gameItems.append(AgricolaItem(title: "Fenced stables", multiplier: 1))
        gameItems.append(AgricolaItem(title: "Clay hut rooms", multiplier: 1))
        gameItems.append(AgricolaItem(title: "Stone house rooms", multiplier: 2))
        gameItems.append(AgricolaItem(title: "Family members", multiplier: 3))
        gameItems.append(AgricolaItem(title: "Points for cards", multiplier: 1))
        gameItems.append(AgricolaItem(title: "Bonus points", multiplier: 1))
        gameItems.append(AgricolaItem(title: "Beggar cards", multiplier: -3))
        
        super.init(gameTitle: "Agricola", gameDescription:
            "The goal of the game is to build the most well-balanced farm at the end of 14 rounds, " +
                "consisting of plowed fields for crops and fenced pastures for livestock. The farm should have " +
                "little fallow land and a large farmhouse built of high quality material. The player should also " +
            "expand the family tending the farm from its initial two members to a maximum of five. - Wikipedia")

    }

    public func numberOfItems() -> Int {
        return gameItems.count
    }
    
    public func gameScore() -> Int? {
        let score = gameItems.reduce(0) {
            if let i = $1.score {
                return $0 + i
            }
            return $0
        }
        
        return score
    }

    /**
    This is a zero based index
    */
    public func titleForLine(line: Int) -> String? {
        if let item = gameItems.ref(line) {
            return item.title
        }
        return nil
    }

    public func itemsForLine(line: Int) -> Int? {
        if let item = gameItems.ref(line) {
            return item.userInput
        }
        return nil
    }
    /**
    This is a zero based index
    */
    public func scoreForLine(line: Int) -> Int? {
        if let item = gameItems.ref(line) {
            return item.score
        }
        return nil
    }

    /**
    This is a zero based index
    */
    public func updateScore(score: Int, line: Int) -> Int? {
        var agricolaItem = gameItems.ref(line)
        agricolaItem?.userInput = score
        
        return agricolaItem?.score
    }
}
