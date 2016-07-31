//
//  ToDoTableViewController.swift
//  toDoAppsFirebase
//
//  Created by Mohammad Kukuh on 7/31/16.
//  Copyright © 2016 Mohammad Kukuh. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ToDoTableViewController: UITableViewController {
    
    var toDos = [toDo]()
    var dbRef : FIRDatabaseReference!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = FIRDatabase.database().reference().child("ToDoList")
        ObservingDB()
        footer()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func ObservingDB() {
        dbRef.observeEventType(.Value) { (snapshot:FIRDataSnapshot) in
            
            var newToDos = [toDo]()
            
            for t in snapshot.children{
                let toDoItem = toDo(snapshot: t as! FIRDataSnapshot)
                newToDos.append(toDoItem)
            }
            self.toDos = newToDos
            self.tableView.reloadData()
        }
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath) as! customCell
        
        let plan = toDos[indexPath.row]

        cell.planTitleLabel.text = plan.title
        cell.planDateLabel.text = plan.addDate
        cell.planDescripLabel.text = plan.description
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            let plan = toDos[indexPath.row]
            plan.itemRef?.removeValue()
            
        }
    }
   
    func footer(){
        let view = UIView(frame: CGRectZero)
        self.tableView.tableFooterView = view
        
        self.tableView.backgroundColor = UIColor(red: 0x39/0xFF, green: 0x39/0xFF, blue: 0x39/0xFF, alpha: 0xFF/0xFF)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlanDetail" {
            if let indexpath = self.tableView.indexPathForSelectedRow{
                let destinationController = segue.destinationViewController as! detailView
                destinationController.plan = toDos[indexpath.row].title
                destinationController.date = toDos[indexpath.row].addDate
                destinationController.des = toDos[indexpath.row].description
            }
        }
    }
    
}
