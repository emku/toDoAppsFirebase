//
//  toDo.swift
//  toDoAppsFirebase
//
//  Created by Mohammad Kukuh on 7/31/16.
//  Copyright © 2016 Mohammad Kukuh. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct toDo {
    let key : String!
    let title : String
    let description : String!
    let addDate : String!
    let itemRef : FIRDatabaseReference?

    init(title:String,description:String,addDate:String,key:String=""){
        self.key = key
        self.title = title
        self.description = description
        self.addDate = addDate
        itemRef = nil
    }
    
    init(snapshot:FIRDataSnapshot){
        key = snapshot.key
        itemRef = snapshot.ref
        
        if let toDoTitle = snapshot.value!["title"] as? String{
            title = toDoTitle
        }else{
            title = ""
        }
        if let toDodes = snapshot.value!["description"] as? String{
            description = toDodes
        }else{
            description = ""
        }
        if let toDoDate = snapshot.value!["addDate"] as? String{
            addDate = toDoDate
        }else{
            addDate = ""
        }
    }
    func toAnyObject() -> AnyObject {
        return ["title":title,"description":description,"addDate":addDate]
    }
    
}