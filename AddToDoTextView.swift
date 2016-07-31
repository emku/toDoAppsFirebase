//
//  AddToDoText.swift
//  toDoAppsFirebase
//
//  Created by Mohammad Kukuh on 8/1/16.
//  Copyright © 2016 Mohammad Kukuh. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
class AddToDoTextView: UIViewController {
    
    
    @IBOutlet weak var planTitleText: UITextField!
    @IBOutlet weak var planDescripTextView: UITextView!
    
    var toDos = [toDo]()
    var dbRef : FIRDatabaseReference!
    
    override func viewDidLayoutSubviews() {
        bottomBorderTF(planTitleText)
        bottomBorderTV(planDescripTextView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference().child("ToDoList")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    @IBAction func addButton(sender: AnyObject) {
        
        let addDate = NSDate()
        
        let plan = toDo(title: planTitleText.text!, description: planDescripTextView.text!, addDate: dateToString(addDate))
        let ref = self.dbRef.child(planTitleText.text!.lowercaseString)
        ref.setValue(plan.toAnyObject())
        
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func dateToString (date:NSDate) -> String{
        let dateFormator : NSDateFormatter = NSDateFormatter()
        dateFormator.dateFormat = "dd-MM-yyyy"
        
        return dateFormator.stringFromDate(date)
    }
    
    func bottomBorderTF(textField:UITextField) -> UITextField{
        
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.borderStyle = UITextBorderStyle.None
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        
        return textField
    }
    
    func bottomBorderTV(textView:UITextView) -> UITextView{
        
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: textView.frame.size.height - width, width:  textView.frame.size.width, height: textView.frame.size.height)
        
        border.borderWidth = width
        textView.backgroundColor = UIColor.clearColor()
        textView.layer.addSublayer(border)
        textView.layer.masksToBounds = true
        
        return textView
    }
}
