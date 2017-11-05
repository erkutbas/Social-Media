//
//  ViewController.swift
//  Social-Media
//
//  Created by Erkut Baş on 04/11/2017.
//  Copyright © 2017 Erkut Baş. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additi onal setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookButtonTapped(_ sender: Any) {
        
        print("Erkut: facebookButtonTapped is activated")
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (userResult, error) in
            
            if error != nil {
                
                if let errorMessage = error as NSError? {
                    
                    print("Erkut: errorMessage : \(errorMessage)")
                    
                }
                
            } else if userResult?.isCancelled == true {
                
                print("Erkut: User is cancelled authentication process by himself/herself")
                
            } else {
                
                print("Erkut: User is successfully authenticaed with Facebook")
                
                // facebookAuthProvider firebase in authenticaton sınıfı
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                print("Erkut: credential : \(credential)")
                
                self.firebaseAuth(credential)
                
            }
        }
    }
    
    func firebaseAuth(_ credential : AuthCredential){
        
        Auth.auth().signIn(with: credential) { (user, error) in
            
            if error != nil {
                
                if let errorMessage = error as NSError? {
                    
                    print("Erkut: errorMessage :\(errorMessage.userInfo)")
                    
                }
                
            } else {
                
                print("Erkut: User is successfully authenticated")
                
            }
        }
    }

}


























