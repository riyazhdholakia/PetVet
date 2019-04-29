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
    
    var names: [String] = []
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
                self.address.append(addressType)
                print(addressType)
                self.tableView.reloadData()
            })
            ref.child("users").child(uid).child("petName").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                //let username = value?["username"] as? String ?? ""
                let petName = snapshot.value as? String ?? ""
                self.pets.append(petName)
                print(petName)
                self.tableView.reloadData()
            })
            ref.child("users").child(uid).child("phoneNumber").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                //let username = value?["username"] as? String ?? ""
                let phoneNumber = snapshot.value as? String ?? ""
                self.phoneNum.append(phoneNumber)
                print(phoneNumber)
                self.tableView.reloadData()
            })
            ref.child("users").child(uid).child("name").observeSingleEvent(of: .value, with: { (snapshot) in
                // Get user value
                let value = snapshot.value as? NSDictionary
                //let username = value?["username"] as? String ?? ""
                let name = snapshot.value as? String ?? ""
                self.names.append(name)
                print(name)
                self.tableView.reloadData()
            })
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return names.count
        case 1:
            return phoneNum.count
        case 2:
            return pets.count
        case 3:
            return address.count
        default:
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Name"
        case 1:
            return "Phone Number"
        case 2:
            return "Pet"
        case 3:
            return "Address Type"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mixed", for: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = names[indexPath.row]
        case 1:
            cell.textLabel?.text = phoneNum[indexPath.row]
        case 2:
            cell.textLabel?.text = pets[indexPath.row]
        case 3:
            cell.textLabel?.text = address[indexPath.row]
        default:
            cell.textLabel?.text =  ""
        }
        return cell
        
    }
    
}
