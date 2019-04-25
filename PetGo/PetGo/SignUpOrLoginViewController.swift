//
//  ViewController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/12/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class SignUpOrLoginViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordTextLabel: UITextField!
    @IBOutlet weak var errorMsgLabel: UILabel!
    
    @IBOutlet weak var theRealEmailTextLabel: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            if let user = user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                let uid = user.uid
                let email = user.email
                let photoURL = user.photoURL
                // ...
            }
        }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    @IBAction func onSubmitPressed(_ sender: Any) {
        
//            if let theRealEmailTextLabel = theRealEmailTextLabel.text {
//                if let passwordTextLabel = passwordTextLabel.text {
                    switch segmentedControl.selectedSegmentIndex
                    {
                    case 0:
                        //if passwordTextLabel.text == confirmPasswordTextLabel.text {
                        Auth.auth().createUser(withEmail: theRealEmailTextLabel.text!, password: passwordTextLabel.text!) { authResult, error in
                            self.errorMsgLabel.text = error?.localizedDescription
                            if error == nil {
                                NotificationCenter.default.post(name: loginDidCompleteNotification, object: nil)
                            }
                            print(error.debugDescription)
                            
                            print(self.theRealEmailTextLabel.text!)
                            print(self.passwordTextLabel.text!)
                        }
                        //self.ref.child("users").child().setValue(["email": theRealEmailTextLabel.text!])
//                            else {
//                                errorMsgLabel.text = "Password and Confirm Password do not match"
//                            }
                    //}
                    case 1:
                    Auth.auth().signIn(withEmail: theRealEmailTextLabel.text!, password: passwordTextLabel.text!) { [weak self] user, error in
                        guard let strongSelf = self else { return }
                        self?.errorMsgLabel.text = error?.localizedDescription
                        if error == nil {
                            NotificationCenter.default.post(name: loginDidCompleteNotification, object: nil)
                        }
                        print(error.debugDescription)
                        print(self!.passwordTextLabel.text!)
                        print(self!.theRealEmailTextLabel.text!)
                        print(self!.passwordTextLabel.text!)
                    }
                    default:
                    break
               // }
            //}
        }
        
    }
    @IBAction func onSegmentedControlPressed(_ sender: Any) {
    }
}

