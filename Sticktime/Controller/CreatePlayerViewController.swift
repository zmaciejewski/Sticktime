//
//  CreatePlayerViewController.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 6/9/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit

class CreatePlayerViewController: UIViewController {
    @IBOutlet weak var buttonAddPlayer: UIButton!
    @IBOutlet weak var textPlayerName: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonOnClick(_ sender: Any) {
        appDelegate.playerList.append(textPlayerName.text!)
    }

}
