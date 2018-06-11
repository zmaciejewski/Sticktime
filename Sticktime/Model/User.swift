//
//  User.swift
//  Sticktime
//
//  Created by Caleb Rudnicki on 6/10/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import Foundation
import FirebaseAuth

struct SticktimeUser {
    let uid: String
    let email: String
    
    init(userData: User) {
        uid = userData.uid
        
        if let mail = userData.providerData.first?.email {
            email = mail
        } else {
            email = ""
        }
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
