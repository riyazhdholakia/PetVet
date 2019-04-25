//
//  AddAddressViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/24/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class AddAddressViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
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
            ref.child("users/\(user.uid)/addressStreet").setValue(streetTextField.text!)
            ref.child("users/\(user.uid)/addressCity").setValue(cityTextField.text!)
            ref.child("users/\(user.uid)/addressState").setValue(stateTextField.text!)
            ref.child("users/\(user.uid)/addressZipCode").setValue(zipCodeTextField.text!)
        }
    }
    
}
