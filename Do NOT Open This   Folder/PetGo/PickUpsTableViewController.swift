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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchPickUps()
    }
    
    func fetchPickUps() {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("users/petName").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let petName = snapshot.value as? String ?? ""
            print("HIIIIIIIIIII" + petName + "BYYYYE")
            print(snapshot.value)
            self.pickups.append(petName)
            self.tableView.reloadData()
            print(self.pickups)
        })
        
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

