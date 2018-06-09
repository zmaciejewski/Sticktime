//
//  ViewController.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 6/1/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit
import DragDropiOS

class ViewController: UIViewController {
    @IBOutlet weak var collectionViewTop: UICollectionView!
    @IBOutlet weak var collectionViewBottom: UICollectionView!
    let nameArrayTop = ["player1", "player2", "player3", "player4"]
    let nameArrayBottom = ["player4", "player5", "player6", "player 7","Caleb"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionViewTop.delegate = self
        collectionViewTop.dataSource = self
        collectionViewBottom.delegate = self
        collectionViewBottom.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewTop {
            return nameArrayTop.count
        } else {
            return nameArrayBottom.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionViewCell
        
        if collectionView == self.collectionViewTop {
            cell.displayContent(title: nameArrayTop[indexPath.row])
        } else {
            cell.displayContent(title: nameArrayBottom[indexPath.row])
        }
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewTop {
            print(nameArrayTop[indexPath.row])
        } else {
            print(nameArrayBottom[indexPath.row])
        }
    }
}

