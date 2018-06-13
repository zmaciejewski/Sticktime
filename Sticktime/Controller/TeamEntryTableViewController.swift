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
        startObservingDatabase()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
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
        addPlayerAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: { (action: UIAlertAction) in
            let playerName = addPlayerAlert.textFields![0] as UITextField
            let playerNumber = addPlayerAlert.textFields![1] as UITextField
            print(playerName.text)
            print(playerNumber.text)
//            let player = Player(content: playerContent, addedByUser: "TestUser")
//            let playerRef = self.dbRef.child(playerContent.lowercased())
//            playerRef.setValue(player.toAnyObject())
        }))
        self.present(addPlayerAlert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        print(appDelegate.playerList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return appDelegate.playerList.count
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        let player = players[indexPath.row]
        cell.displayContent(title: player.content)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let player = players[indexPath.row]
            player.itemRef?.removeValue()
        }
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
