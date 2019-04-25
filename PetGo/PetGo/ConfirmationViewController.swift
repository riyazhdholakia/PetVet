//
//  ConfirmationViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/19/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase

class ConfirmationViewController: UIViewController {
    
    @IBOutlet weak var confirmationLabel: UILabel!
    var min = 100000
    var max = 999999
    override func viewDidLoad() {
        let number = Int.random(in: 100000 ... 999999)
        print(number)
        confirmationLabel.text = "Confirmation Number: \(number)"
    }
    
//    func randomInt(min: Int, max: Int) -> Int {
//        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
//    }
//
    @IBAction func onDismissTapped(_ sender: Any) {
        
    }
    
}
