//
//  GoalieViewController.swift
//  Sticktime
//
//  Created by Zachary Maciejewski on 8/2/18.
//  Copyright © 2018 Zachary Maciejewski. All rights reserved.
//

import UIKit

class GoalieViewController: UIViewController {

    static var labels = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for label in GoalieViewController.labels {
            self.view.addSubview(label)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            print(position)
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.center = CGPoint(x: position.x, y: position.y)
            label.textAlignment = .center
            label.text = "X"
            self.view.addSubview(label)
            GoalieViewController.labels.append(label)
            //self.performSegue(withIdentifier: "segue", sender: nil)
            navigationController?.popViewController(animated: false)
        }
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
