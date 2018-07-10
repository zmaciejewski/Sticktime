//
//  MainViewController.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 7/9/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit
import CircleMenu

class MainViewController: UIViewController, CircleMenuDelegate {
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func leftWingButtonPressed(_ sender: Any) {
        print("Left wing button pressed")
    }
    
    @IBAction func rightWingButtonPressed(_ sender: Any) {
        print("Right wing button pressed")
    }
    
    @IBAction func centerButtonPressed(_ sender: Any) {
        print("Center button pressed")
    }
    
    @IBAction func leftDButtonPressed(_ sender: Any) {
        print("Left D button pressed")
    }
    
    @IBAction func rightDButtonPressed(_ sender: Any) {
        print("Right D button pressed")
    }
    
    @IBAction func goalieButtonPressed(_ sender: Any) {
        print("Goalie button pressed")
    }
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        print("Circle Menu")
    }

}
