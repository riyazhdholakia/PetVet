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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataPicker.minimumDate = Date()
        
    }
    
    @IBAction func onConfirmPressed(_ sender: Any) {
        print(dataPicker.date);
    }
    
}
