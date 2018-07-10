//
//  MainViewController.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 7/9/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit
import CircleMenu

class MainViewController: UIViewController, CircleMenuDelegate, UITableViewDataSource {
    @IBOutlet weak var centerButton: CircleMenu!
    @IBOutlet weak var lwButton: CircleMenu!
    @IBOutlet weak var rwButton: CircleMenu!
    @IBOutlet weak var ldButton: CircleMenu!
    @IBOutlet weak var rdButton: CircleMenu!
    @IBOutlet weak var goalieButton: CircleMenu!
    
    @IBOutlet weak var statTableView: UITableView!
    @IBOutlet weak var playerTableView: UITableView!
    
    private var statData = ["Shot", "Hit", "Block", "Turnover", "Take Away"]
    private var playerData = ["Magic", "Caleb", "Karl", "Jack", "Drew", "Kevin", "Alex"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        centerButton.buttonsCount = 4
        centerButton.duration = 0.5
        centerButton.delegate = self
        centerButton.distance = 75
        
        lwButton.buttonsCount = 4
        lwButton.duration = 0.5
        lwButton.delegate = self
        lwButton.distance = 75
        
        rwButton.buttonsCount = 4
        rwButton.duration = 0.5
        rwButton.delegate = self
        rwButton.distance = 75
        
        ldButton.buttonsCount = 4
        ldButton.duration = 0.5
        ldButton.delegate = self
        ldButton.distance = 75
        
        rdButton.buttonsCount = 4
        rdButton.duration = 0.5
        rdButton.delegate = self
        rdButton.distance = 75
        
        goalieButton.buttonsCount = 4
        goalieButton.duration = 0.5
        goalieButton.delegate = self
        goalieButton.distance = 75
        
        statTableView.dataSource = self
        playerTableView.dataSource = self
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
    
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        circleMenu.setTitle("\(atIndex)", for: .normal)
        centerButton.alpha = 1
        lwButton.alpha = 1
        rwButton.alpha = 1
        ldButton.alpha = 1
        rdButton.alpha = 1
        goalieButton.alpha = 1
    }
    
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        centerButton.alpha = 0
        lwButton.alpha = 0
        rwButton.alpha = 0
        ldButton.alpha = 0
        rdButton.alpha = 0
        goalieButton.alpha = 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == statTableView {
            return statData.count
        }
        else {
            return playerData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        if tableView == self.statTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "statCell")
            let text = statData[indexPath.row]
            cell?.textLabel?.text = text
        }
        if tableView == self.playerTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "playerListCell")
            let text = playerData[indexPath.row]
            cell?.textLabel?.text = text
        }
        return cell!
    }
    
}
