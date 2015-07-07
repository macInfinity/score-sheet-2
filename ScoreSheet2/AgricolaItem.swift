//
// Created by Chris Maki on 7/3/15.
// Copyright (c) 2015 Chris Maki. All rights reserved.
//

import Foundation

// public for testing
public class AgricolaItem {

    struct Constants {
        static let noMultiplier = -999
    }

    var title: String
    var multipleValues = [Int]()
    var multiplier = Constants.noMultiplier

    public var userInput: Int?
    
    // public for testing, otherwise it would be default
    public var score: Int? {
        get {
            // make sure we get the correct array subscript (arrays start at 0)
            if let input = userInput {
                if multiplier == Constants.noMultiplier {
                    return multipleValues.refOneBasedOrLast(input)
                } else {
                    return input * multiplier
                }
            }
            // there's no userInput so just return nil
            return nil            
        }
    }

    public init(title: String, multipleValues: [Int]) {
        self.title = title
        self.multipleValues = multipleValues
    }
    
    public init(title: String, multiplier: Int) {
        self.title = title
        self.multiplier = multiplier
    }


}