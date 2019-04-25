//
//  PickUpAddressTableViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/22/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class PickUpAddressTableViewController: UITableViewController {
    
    //var pets = ["billy", "joe"]
    var addresses: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchAddresses()
    }
    
    func fetchAddresses() {
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("users/addressStreet").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
            // let user = User(username: username)
            var address = snapshot.value as? String ?? ""
            print("HIIIIIIIIIII" + address + "BYYYYE")
            print(snapshot.value)
            self.addresses.append(address)
            self.tableView.reloadData()
            // ...
            print(self.addresses)
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return addresses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath)
        cell.textLabel?.text = addresses[indexPath.row]
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "Services", sender: self)
//    }
}
