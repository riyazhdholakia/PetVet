//
//  ProfileTableViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/15/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileTableViewController: UITableViewController {
    
    var name: [String] = []
    var pets: [String] = []
    var address: [String] = []
    var phoneNum: [String] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            //var stringUid : String {uid}
            ref.child("users").child(uid).child("addressType").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                //let username = value?["username"] as? String ?? ""
                let addressType = snapshot.value as? String ?? ""
                print(addressType)
                self.tableView.reloadData()
            })
            ref.child("users").child(uid).child("petName").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                //let username = value?["username"] as? String ?? ""
                let petName = snapshot.value as? String ?? ""
                print(petName)
                self.tableView.reloadData()
            })
            ref.child("users").child(uid).child("phoneNumber").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                //let username = value?["username"] as? String ?? ""
                let phoneNumber = snapshot.value as? String ?? ""
                print(phoneNumber)
                self.tableView.reloadData()
            })
            ref.child("users").child(uid).child("name").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                //let username = value?["username"] as? String ?? ""
                let name = snapshot.value as? String ?? ""
                print(name)
                self.tableView.reloadData()
            })
        }
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        
//    }
//    
}
