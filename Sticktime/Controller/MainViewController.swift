//
//  MainViewController.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 7/9/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit
import CircleMenu
import DragMenuPicker

class MainViewController: UIViewController, CircleMenuDelegate, DragMenuViewDelegate, UITableViewDataSource {
    @IBOutlet weak var centerButton: CircleMenu!
    @IBOutlet weak var lwButton: CircleMenu!
    @IBOutlet weak var rwButton: CircleMenu!
    @IBOutlet weak var ldButton: CircleMenu!
    @IBOutlet weak var rdButton: CircleMenu!
    @IBOutlet weak var goalieButton: CircleMenu!
    
    @IBOutlet weak var statTableView: UITableView!
    @IBOutlet weak var playerTableView: UITableView!
    
    @IBOutlet weak var horizontalDragPicker: DragMenuPicker!
    
    @IBOutlet weak var rwDragPicker: DragMenuPicker!
    @IBOutlet weak var lwDragPicker: DragMenuPicker!
    @IBOutlet weak var ldDragPicker: DragMenuPicker!
    @IBOutlet weak var rdDragPicker: DragMenuPicker!
    
    //var tableCurrName = 0
    //var tableCurrStat = 0
    //var statTrue = true
    
    @IBOutlet weak var timeButton: UIButton!
    var time = 1200
    var timer = Timer()
    var isTiming = false
    
    var shotCounter = 0 {
        didSet {
            shotsAgainst.text = "Shots: " + String(shotCounter)
            let y = Double(round(1000*Double(shotCounter-away)/Double(shotCounter))/1000)
            savePercentage.text = "Save%: " + String(y)
        }
    }
    
    var shotForCounter = 0 {
        didSet {
            shotsFor.text = "Shots: " + String(shotForCounter)
            let y = Double(round(1000*Double(shotForCounter-home)/Double(shotForCounter))/1000)
            savePercentageAgainst.text = "Save%: " + String(y)
        }
    }
    
    @IBOutlet weak var shotsAgainst: UILabel!
    @IBOutlet weak var savePercentage: UILabel!
    @IBOutlet weak var shotsFor: UILabel!
    @IBOutlet weak var savePercentageAgainst: UILabel!
    
    var home = 0 {
        didSet {
            let y = Double(round(1000*Double(shotForCounter-home)/Double(shotForCounter))/1000)
            savePercentageAgainst.text = "Save%: " + String(y)
        }
    }
    var away = 0 {
        didSet {
            let y = Double(round(1000*Double(shotCounter-away)/Double(shotCounter))/1000)
            savePercentage.text = "Save%: " + String(y)
        }
    }
    
    var period = 1 {
        didSet {
            periodButton.setTitle("Period: " + String(period), for: .normal)
        }
    }
    @IBOutlet weak var periodButton: UIButton!
    var canChangePeriod = false
    
    private var statData = ["Shot", "Hit", "Block", "Turnover", "Take Away"]
    private var playerData = ["Magic", "Caleb", "Karl", "Jack", "Drew", "Kevin", "Alex"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        //horizontalDragPicker?.title = "Center"
        
        horizontalDragPicker?.items = ["Risley", "Polak", "Gauvin", "Rankin"]
        horizontalDragPicker?.direction = .vertical
        horizontalDragPicker?.margins = 20
        horizontalDragPicker?.itemLabel.textAlignment = .center
        horizontalDragPicker?.menuDelegate = self
        horizontalDragPicker?.didSelectItem = { item, index in
            print("\(item) selected at index \(index)")
        }
        lwDragPicker?.items = ["Markwordt", "Leon", "Lublin", "Burg"]
        lwDragPicker?.direction = .horizontal
        lwDragPicker?.margins = 20
        lwDragPicker?.itemLabel.textAlignment = .center
        lwDragPicker?.menuDelegate = self
        lwDragPicker?.didSelectItem = { item, index in
            print("\(item) selected at index \(index)")
        }
        rwDragPicker?.items = ["Broz", "Collins", "Holt", "Petrick"]
        rwDragPicker?.direction = .horizontal
        rwDragPicker?.margins = 20
        rwDragPicker?.itemLabel.textAlignment = .center
        rwDragPicker?.menuDelegate = self
        rwDragPicker?.didSelectItem = { item, index in
            print("\(item) selected at index \(index)")
        }
        ldDragPicker?.items = ["Magic", "Newbie", "Wallace"]
        ldDragPicker?.direction = .horizontal
        ldDragPicker?.margins = 20
        ldDragPicker?.itemLabel.textAlignment = .center
        ldDragPicker?.menuDelegate = self
        ldDragPicker?.didSelectItem = { item, index in
            print("\(item) selected at index \(index)")
        }
        rdDragPicker?.items = ["Jones", "Cael", "Chen"]
        rdDragPicker?.direction = .horizontal
        rdDragPicker?.margins = 20
        rdDragPicker?.itemLabel.textAlignment = .center
        rdDragPicker?.menuDelegate = self
        rdDragPicker?.didSelectItem = { item, index in
            print("\(item) selected at index \(index)")
        }
        
        //let tap = UITapGestureRecognizer(target: self.lwDragPicker, action: #selector(self.handleTap(_:)))
        
        //lwDragPicker.addGestureRecognizer(tap)
        
        //view.isUserInteractionEnabled = true
        
        //self.view.addSubview(view)
        
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
    
    @IBAction func Countdown(_ sender: Any) {
        if !isTiming {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainViewController.counter), userInfo: nil, repeats: true)
            isTiming = true
        } else {
            isTiming = false
            timer.invalidate()
        }
    }
    
    @objc func counter(){
        if time == 0 {
            isTiming = false
            timer.invalidate()
            canChangePeriod = true
        } else {
            time -= 1
            let minutes = time/60
            let seconds = time%60
            let reportTime =  String(format:"%02i:%02i", minutes, seconds)
            
            timeButton.setTitle(String(reportTime), for: .normal)
        }
    }
    
    @IBAction func homeScore(_ sender: UIButton) {
        home += 1
        sender.setTitle(String(home), for: .normal)
    }
    
    @IBAction func awayScore(_ sender: UIButton) {
        away += 1
        sender.setTitle(String(away), for: .normal)
    }
    
    @IBAction func changePeriod(_ sender: UIButton) {
        if period == 3 {
            periodButton.setTitle("End Game", for: .normal)
        } else if canChangePeriod {
            time = 1200
            let minutes = time/60
            let seconds = time%60
            let reportTime =  String(format:"%02i:%02i", minutes, seconds)
            
            timeButton.setTitle(String(reportTime), for: .normal)
            
            period += 1
            canChangePeriod = false
        }
    }
    
    @IBAction func shotAt(_ sender: UIButton) {
        shotCounter += 1
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

    /*
    func dragMenuViewWillDisplayMenu(_ dragMenuView: DragMenuView) {
        scrollView?.panGestureRecognizer.isEnabled = false
    }
    
    func dragMenuViewDidDisplayMenu(_ dragMenuView: DragMenuView) {
        scrollView?.panGestureRecognizer.isEnabled = true
    }*/
    
    func dragMenuViewDidDismissMenu(_ dragMenuView: DragMenuView) {
        shotForCounter += 1
    }
    
    func dragMenuView(_ dragMenuView: DragMenuView, didSelect item: String, at index: Int) {
        print("(from delegate) \(item) selected at index \(index)")
        shotForCounter -= 1
    }
    
}
