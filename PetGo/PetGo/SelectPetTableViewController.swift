//
//  SelectPetTableViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/22/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SelectPetTableViewController: UITableViewController {
    
    //var pets = ["billy", "joe"]
    var pets: [String] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchPets()
    }
    
    func fetchPets() {
        ref = Database.database().reference()
        let user = Auth.auth().currentUser
        if let user = user {
        let uid = user.uid
        let email = user.email
        
        ref.child("users").child(uid).child("petName").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            //let username = value?["username"] as? String ?? ""
            let petName = snapshot.value as? String ?? ""
            self.pets.append(petName)
            print(petName)
            self.tableView.reloadData()
        })
        }

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetsCell", for: indexPath)
        cell.textLabel?.text = pets[indexPath.row]
        return cell
    }
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
    //        let currentCell = tableView.cellForRow(at: indexPath!) as! UITableViewCell
    //print("Printing here1: " + (currentCell.textLabel?.text)!)
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
        ref.child("users/\(user.uid)/selectedPet").setValue(pets[indexPath.row])
        print("Printing here: " + (pets[indexPath.row]))
//        let vc = self.storyboard!.instantiateViewController(withIdentifier: "Clinics") as! UITableViewController
//        self.present(vc, animated: true, completion: nil)
    }
    }
    }
    
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
////        let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
////        let currentCell = tableView.cellForRow(at: indexPath!) as! UITableViewCell
////print("Printing here1: " + (currentCell.textLabel?.text)!)
//        ref = Database.database().reference()
//        let user = Auth.auth().currentUser
//        if let user = user {
//            // The user's ID, unique to the Firebase project.
//            // Do NOT use this value to authenticate with your backend server,
//            // if you have one. Use getTokenWithCompletion:completion: instead.
//            let uid = user.uid
//            let email = user.email
//            print(uid)
//            print(email!)
//            // ...
//            ref.child("users/\(user.uid)/selectedPet").setValue(pets[indexPath.row])
//            print("Printing here: " + (pets[indexPath.row]))
//            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Clinics") as! UITableViewController
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
//}
