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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = contentView.frame.width / 2
    }
    
    func displayContent(title: String, color: UIColor) {
        label.text = title
        backgroundColor = color
    }
    
}
