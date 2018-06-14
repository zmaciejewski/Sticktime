//
//  TeamEntryTableViewController.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 6/9/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class TeamEntryTableViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var dbRef: DatabaseReference!
    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = Database.database().reference().child("players")
        startObservingDatabase() //CR: This allows the tableview to listen to changes in the database and automatically update
    }
    
    func startObservingDatabase() {
        dbRef!.observe(.value, with: { (snapshot: DataSnapshot) in
            var newPlayers = [Player]()
            for player in snapshot.children {
                let playerObject = Player(snapshot: player as! DataSnapshot)
                newPlayers.append(playerObject)
            }
            self.players = newPlayers
            self.tableView.reloadData()
        })
    }
    
    @IBAction func addPlayer(_ sender: Any) {
        let addPlayerAlert = UIAlertController(title: "Add Player", message: "Enter player info", preferredStyle: .alert)
        addPlayerAlert.addTextField(configurationHandler: { (nameField: UITextField) in
            nameField.placeholder = "Player Name"
        })
        addPlayerAlert.addTextField(configurationHandler: { (numberField: UITextField) in
            numberField.placeholder = "Player Number"
        })
        //CR: Add one more textfield to get a players position
        addPlayerAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action: UIAlertAction) in
            let playerName = addPlayerAlert.textFields![0] as UITextField
            let playerNumber = addPlayerAlert.textFields![1] as UITextField
            print(playerName.text!)
            print(playerNumber.text!)
            
            //CR: Create a Player Object Here
            
            /*CR: Uncomment the code below once you are done
                  These two lines assign a var named playerRef to be a dictionary
                  containing all of the data that a player object holds
             */
//            let playerRef = self.dbRef.child((playerName.text?.lowercased())!)
//            playerRef.setValue(player.toAnyObject())
        }))
        self.present(addPlayerAlert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        let player = players[indexPath.row]
        /*CR: Once you successfully have a player object with a name, number, and positon,
              create a string variable that is something like 'name - number - positon'
              and pass that into displayContent below to populate the tableview's cell
        */
        cell.displayContent(title: player.name)

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let player = players[indexPath.row]
            player.itemRef?.removeValue()
        }
    }
    
}
