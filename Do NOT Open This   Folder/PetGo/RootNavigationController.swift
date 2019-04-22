//
//  RootNavigationController.swift
//  PetGo
//
//  Created by Riyazh Dholakia on 4/19/19.
//  Copyright © 2019 Riyazh Dholakia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

let loginDidCompleteNotification = Notification.Name("LogMeInDidCompleteNotification")

class RootNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: loginDidCompleteNotification, object: nil, queue: .main) { _ in
            if let loginVC = self.presentedViewController as? SignUpOrLoginViewController {
                loginVC.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser == nil {
            let loginVC = self.storyboard!.instantiateViewController(withIdentifier: "loginVC")
            self.present(loginVC, animated: animated, completion: nil)
        }
    }
}
