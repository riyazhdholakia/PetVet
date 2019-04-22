//
//  HomePageViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/19/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class HomePageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if Auth.auth().currentUser != nil {
//            // User is signed in.
//            // ...
//        } else {
//            // No user is signed in.
//            // ...
//        }
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        let userID = Auth.auth().currentUser?.uid
        ref.child("Clinics/clinicCity").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let username = value?["username"] as? String ?? ""
           // let user = User(username: username)
            let clinicCity = snapshot.value as? String ?? ""
            print("HIIIIIIIIIII" + clinicCity + "BYYYYE")
            print(snapshot.value)
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
