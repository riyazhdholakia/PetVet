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
    var confirmNum = 0
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        let number = Int.random(in: 100000 ... 999999)
        confirmNum = number
        print(number)
        confirmationLabel.text = "Confirmation Number: \(number)"
    }
    
//    func randomInt(min: Int, max: Int) -> Int {
//        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
//    }
//
    @IBAction func onDismissTapped(_ sender: Any) {
        ref = Database.database().reference()
        let user = Auth.auth().currentUser
        if let user = user {
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            let uid = user.uid
            let email = user.email
            print(uid)
            print(email!)
            // ...
            ref.child("users/\(user.uid)/confirmationNum").setValue(confirmNum)
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Root") as! UINavigationController
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
