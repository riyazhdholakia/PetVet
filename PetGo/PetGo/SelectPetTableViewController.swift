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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPets()
    }
    
    func fetchPets() {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("users/petName").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
            // let user = User(username: username)
            var petName = snapshot.value as? String ?? ""
            print("HIIIIIIIIIII" + petName + "BYYYYE")
            print(snapshot.value)
            self.pets.append(petName)
            self.tableView.reloadData()
            // ...
            print(self.pets)
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetsCell", for: indexPath)
        cell.textLabel?.text = pets[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "Clinics", sender: self)
//    }
}
