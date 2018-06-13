//
//  CollectionViewCell.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 6/1/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    func displayContent(title:String) {
        label.text = title
    }
}
