//
//  AgricolaTableViewCell.swift
//  ScoreSheet2
//
//  Created by Chris Maki on 7/19/15.
//  Copyright (c) 2015 Chris Maki. All rights reserved.
//

import UIKit

class AgricolaTableViewCell: UITableViewCell {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var items: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
