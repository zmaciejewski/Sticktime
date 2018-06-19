//
//  Player.swift
//  Sticktime
//
//  Created by Caleb Rudnicki on 6/10/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Player {
    
    let name: String!
    let number: Int!
    let position: String!
    
    let key: String!
    let itemRef: DatabaseReference?
    
    init(name: String, number: Int, position: String) {
        self.name = name
        self.number = number
        self.position = position
        self.key = ""
        self.itemRef = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        itemRef = snapshot.ref
        
        if let playerName = (snapshot.value! as! NSDictionary).value(forKey: "name") as? String {
            name = playerName
        } else {
            name = ""
        }
    
        if let playerNumber = (snapshot.value! as! NSDictionary).value(forKey: "number") as? Int {
            number = playerNumber
        } else {
            number = 00
        }
        
        if let playerPosition = (snapshot.value! as! NSDictionary).value(forKey: "position") as? String {
            position = playerPosition
        } else {
            position = ""
        }
    }
    
    func toAnyObject() -> AnyObject {
        return ["name": name, "number": number, "positon": position] as AnyObject
    }
}


