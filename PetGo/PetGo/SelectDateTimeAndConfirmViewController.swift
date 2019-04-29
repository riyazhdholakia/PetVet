//
//  SelectDateTimeAndConfirmViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/22/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SelectDateTimeAndConfirmViewController: UIViewController {
    
    @IBOutlet weak var dataPicker: UIDatePicker!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataPicker.minimumDate = Date()
        
    }
    
    @IBAction func onConfirmPressed(_ sender: Any) {
        print(dataPicker.date);
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy hh:mm a"
        let stringDate = dateFormatter.string(from: dataPicker.date)
    
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
            ref.child("users/\(user.uid)/selectedDate").setValue(stringDate)
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Confirm")
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
