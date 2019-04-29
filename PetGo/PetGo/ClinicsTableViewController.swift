//
//  ClinicsTableViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/22/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ClinicsTableViewController: UITableViewController {
    
    //var pets = ["billy", "joe"]
    var clinicNames: [String] = ["Atlanta Vet", "Atlanta Pet Hospital"]
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //fetchClinics()
    }
    
//    func fetchClinics() {
//        var ref: DatabaseReference!
//
//        ref = Database.database().reference()
//
//        ref.child("Clinics/clinicName").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let username = value?["username"] as? String ?? ""
//            // let user = User(username: username)
//            var clinicName = snapshot.value as? String ?? ""
//            print("HIIIIIIIIIII" + clinicName + "BYYYYE")
//            print(snapshot.value)
//            self.clinicNames.append(clinicName)
//            self.tableView.reloadData()
//            // ...
//            print(self.clinicNames)
//        })
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return clinicNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClinicsCell", for: indexPath)
        cell.textLabel?.text = clinicNames[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        let currentCell = tableView.cellForRow(at: indexPath!) as! UITableViewCell
        
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
            ref.child("users/\(user.uid)/selectedClinic").setValue(currentCell.textLabel!.text)
//            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Services") as! UITableViewController
//            self.present(vc, animated: true, completion: nil)
        }
    }
}
