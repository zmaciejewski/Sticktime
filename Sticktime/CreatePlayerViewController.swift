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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonOnClick(_ sender: Any) {
        //print(textPlayerName.text!)
        appDelegate.playerList.append(textPlayerName.text!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
