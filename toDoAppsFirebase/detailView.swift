//
//  detailView.swift
//  toDoAppsFirebase
//
//  Created by Mohammad Kukuh on 8/1/16.
//  Copyright © 2016 Mohammad Kukuh. All rights reserved.
//

import UIKit

class detailView: UIViewController {

    @IBOutlet weak var planTitleLabel: UILabel!
    @IBOutlet weak var planTitleDesTextView: UITextView!
    @IBOutlet weak var planDateLabel: UILabel!
    
    var plan = ""
    var des = ""
    var date = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        planTitleDesTextView.text = des
        planTitleLabel.text = plan
        planDateLabel.text = date
        
    }
}
