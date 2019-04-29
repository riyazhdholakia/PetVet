//
//  PickUpsTableViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/15/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PickUpsTableViewController: UITableViewController {
    
    //var pets = ["billy", "joe"]
    var pickups: [String] = []
    var petNames: [String] = []
    var confirmationNums: [String] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchPickUps()
    }
    
    func fetchPickUps() {
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
            ref.child("users").child(uid).child("selectedPet").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value1 = snapshot.value as? NSDictionary
                //let username = value?["username"] as? String ?? ""
                let petName = snapshot.value as? String ?? ""
                //self.pickups.append(petName)
               // self.tableView.reloadData()
                
                self.ref.child("users").child(uid).child("selectedDate").observeSingleEvent(of: .value, with: { (snapshot) in
                    // Get user value
                    let value2 = snapshot.value as? NSDictionary
                    //let username = value?["username"] as? String ?? ""
                    let date = snapshot.value as? String ?? ""
                    self.pickups.append(petName + " " + date)
                    self.tableView.reloadData()
                })
            })
        }
        
        
//        ref.child("users/confirmationNum").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            var confirmationNum = snapshot.value as? String ?? ""
//            print("HIIIIIIIIIII" + confirmationNum + "BYYYYE")
//            print(snapshot.value)
//            self.confirmationNums.append(confirmationNum)
//            //self.tableView.reloadData()
//            print(self.pickups)
//        })
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pickups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PickUpsCell", for: indexPath)
        cell.textLabel?.text = pickups[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "Services", sender: self)
//    }
}

