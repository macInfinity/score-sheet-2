//
// Created by Chris Maki on 7/12/15.
// Copyright (c) 2015 Chris Maki. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewController {

    @IBAction func cancelGame(sender: AnyObject) {
        let cancelGameAlert = UIAlertController(title: "Cancel Game?",
                message: "Are you sure you want to cancel your game?",
                preferredStyle: UIAlertControllerStyle.Alert)
        let cancelTheGameAction = UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default) { _ in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        let donnotCancelTheGameAction = UIAlertAction(title: "No!", style: UIAlertActionStyle.Default, handler: nil)
        cancelGameAlert.addAction(cancelTheGameAction)
        cancelGameAlert.addAction(donnotCancelTheGameAction)

        self.presentViewController(cancelGameAlert, animated: true, completion: nil)
    }
}
