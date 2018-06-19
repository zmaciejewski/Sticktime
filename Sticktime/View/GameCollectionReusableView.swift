//
//  CollectionReusableView.swift
//  Sticktime
//
//  Created by Caleb Rudnicki on 6/15/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit

class GameCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var label: UILabel!
    
    func displayContent(label: String) {
        self.label.text = label
    }
}
