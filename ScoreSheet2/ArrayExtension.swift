//
// Created by Chris Maki on 7/6/15.
// Copyright (c) 2015 Chris Maki. All rights reserved.
//

import Foundation

extension Array {

    func ref(i:Int) -> T? {
        return 0 <= i && i < count ? self[i] : nil
    }

    func refOrLast(i:Int) -> T? {
        if i < count {
            return self[i]
        } else {
            return self.last
        }

    }
    func refOneBased(i:Int) -> T? {
        return 1 <= i && i <= count ? self[i-1] : nil
    }

    /**
    Acting as if the array were one based (to map more naturally to user input), this method
    will either return the item at `self[i-1]` or `self.last` if `i` is greater than the number
    of entries in the array.
    */
    func refOneBasedOrLast(i:Int) -> T? {
        // we are using a one based array so if `i` is anything less than 1, we can igore it
        if 1 <= i {
            // normally you'd want to check for `i < count` but we are actiing like this is a one based array
            if i <= count {
                // finally, we know `i` is a valid value so we can subtract one and fetch
                return self[i-1]
            } else {
                return self.last
            }
        }
        // the index `i` was not in the range of this array, return nil
        return nil
    }
}
