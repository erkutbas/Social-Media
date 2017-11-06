//
//  FeedViewController.swift
//  Social-Media
//
//  Created by Erkut Baş on 06/11/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signOutTapped(_ sender: Any) {

        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_USER_ID)
        
        print("Erkut : keychainResult :\(keychainResult)")
        print("erkut : baskan")
        
        try! Auth.auth().signOut()
        
        print("Remzi Demo")
        
        performSegue(withIdentifier: "goToSignIn", sender: self)
    }

}
