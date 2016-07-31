//
//  User.swift
//  toDoAppsFirebase
//
//  Created by Mohammad Kukuh on 8/1/16.
//  Copyright © 2016 Mohammad Kukuh. All rights reserved.
//

import Foundation
import FirebaseAuth


struct  User {
    let UID : String
    let email : String
    
    init(userData : FIRUser){
        UID = userData.uid
        
        if let mail = userData.providerData.first?.email{
            email = mail
        }else{
            email = ""
        }
    }
    init(UID:String,email:String){
        self.UID = UID
        self.email = email
    }
    
}