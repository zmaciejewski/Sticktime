//
//  TableViewCell.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 6/9/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    
    func displayContent(title:String) {
        label.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
