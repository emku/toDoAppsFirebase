//
//  customCell.swift
//  toDoAppsFirebase
//
//  Created by Mohammad Kukuh on 7/31/16.
//  Copyright © 2016 Mohammad Kukuh. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var planTitleLabel: UILabel!
    @IBOutlet weak var planDateLabel: UILabel!
    @IBOutlet weak var planDescripLabel: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
          }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
}
