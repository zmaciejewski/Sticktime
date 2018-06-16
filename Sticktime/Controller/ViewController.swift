//
//  ViewController.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 6/1/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let headerArray = ["Forwards", "Defense", "Goalie", "On the Bench"]
    fileprivate let forwardArray = ["12", "3", "17"]
    fileprivate let defenseArray = ["27", "9"]
    fileprivate let goalieArray = ["30"]
    fileprivate let benchArray = ["4", "5", "7", "8", "10", "11", "13", "15", "18", "21", "23", "25", "28"]
    fileprivate let appDelegate = UIApplication.shared.delegate as! AppDelegate
    fileprivate var longPressGesture: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        switch(gesture.state) {
        case .began:
            guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                break
            }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return forwardArray.count
        case 1:
            return defenseArray.count
        case 2:
            return goalieArray.count
        default:
            return benchArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CollectionViewCell
        switch indexPath.section {
        case 0:
            cell.displayContent(title: forwardArray[indexPath.row], color: UIColor.red)
        case 1:
            cell.displayContent(title: defenseArray[indexPath.row], color: UIColor.green)
        case 2:
            cell.displayContent(title: goalieArray[indexPath.row], color: UIColor.cyan)
        default:
            cell.displayContent(title: benchArray[indexPath.row], color: UIColor.blue)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("Starting section: \(sourceIndexPath.section), Starting index: \(sourceIndexPath.item)")
        print("Starting section: \(destinationIndexPath.section), Starting index: \(destinationIndexPath.item)")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! CollectionReusableView
        sectionHeaderView.displayContent(label: headerArray[indexPath.section])
        return sectionHeaderView
    }
    
}
