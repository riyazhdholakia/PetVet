//
//  AddPetViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/24/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class AddPetViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var petTypeTextField: UITextField!
    @IBOutlet weak var petNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = Database.database().reference()
    }
    
    @IBAction func onSaveTapped(_ sender: Any) {
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
            ref.child("users/\(user.uid)/petName").setValue(petTypeTextField.text!)
            ref.child("users/\(user.uid)/petType").setValue(petNameTextField.text!)
            //performSegue(withIdentifier: "Root", sender: nil)
            //presentViewController(nextViewController, animated: true, completion: nil)
            
        }
        
    }
    
}
