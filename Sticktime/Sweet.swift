//
//  Sweet.swift
//  Sticktime
//
//  Created by Caleb Rudnicki on 6/10/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Sweet {
    
    let key: String!
    let content: String!
    let addedByUser: String!
    let itemRef: DatabaseReference?
    
    init(content: String, addedByUser: String, key: String = "") {
        self.key = key
        self.content = content
        self.addedByUser = addedByUser
        self.itemRef = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref

        if let sweetContent = (snapshot.value! as! NSDictionary).value(forKey: "content") as? String {
            content = sweetContent
        } else {
            content = ""
        }
        
        if let sweetUser = (snapshot.value! as! NSDictionary).value(forKey: "addedByUser") as? String {
            addedByUser = sweetUser
        } else {
            addedByUser = ""
        }
    }
    
    func toAnyObject() -> AnyObject {
        return ["content": content, "addedByUser": addedByUser] as AnyObject
    }
}


