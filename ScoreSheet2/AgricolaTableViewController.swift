//
//  AgricolaTableViewController.swift
//  ScoreSheet2
//
//  Created by Chris Maki on 7/12/15.
//  Copyright (c) 2015 Chris Maki. All rights reserved.
//

import UIKit

class AgricolaTableViewController: UITableViewController, UITextFieldDelegate {
    
    private let agricola = Agricola()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gameComplete(sender: AnyObject) {
        // this is where all the detail go, who won, score, etc. this is the complex one
//        
//        let gameCompleteAlert = UIAlertController(title: "Game Complete?", message: "", preferredStyle: UIAlertControllerStyle.Alert)
//        let howDidYouDo = UIAlertLabel("How did you do?")
//        gameCompleteAlert.add
        
    }
    
    

    // MARK: - Textfield delegate methods
    func textFieldDidEndEditing(textField: UITextField) {
        println("textfield value is: \(textField.text)")

        if let itemsValue = textField.text.toInt() {
            let itemLineNumber = textField.tag
            var total = agricola.updateScore(itemsValue, line: itemLineNumber)
            var index = NSIndexPath(forRow: itemLineNumber, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(index) as? AgricolaTableViewCell {
                cell.score.text = String(stringInterpolationSegment: total!);
            }
            NSLog("Current total score: %d", agricola.gameScore()!)
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return agricola.numberOfItems()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("agricolaCell",
                forIndexPath: indexPath) as! AgricolaTableViewCell

        // Configure the cell...
        let row = indexPath.row
        cell.title.text = agricola.titleForLine(row)
        if let score = agricola.scoreForLine(row) {
            cell.score.text = String(score)
        } else {
            cell.score.text = ""
        }
        if let items = agricola.itemsForLine(row) {
            cell.items.text = String(items)
        } 

        /*
        Taken from the previous version of ScoreSheet:
        add the row to the cell as a tag so we can use it later
        turns out if you use zero based tag ID, iOS gets confused, once I made the first cell
        use one instead of zero, moving to the first cell worked like a charm!
        */
//        cell.items.tag = row + 1
        cell.items.tag = row


        return cell
    }


    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCellWithIdentifier("agricolaHeader") as! AgricolaHeaderTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier("agricolaHeaderCell") as! UITableViewCell
//        cell.total.text = String(0)
//
//        return cell
        return nil
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
