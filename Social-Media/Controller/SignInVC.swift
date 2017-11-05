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
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet var emailTextField: FancyField!
    @IBOutlet var passwordTextField: FancyField!
    
    // COK ÖNEMLİ
    // viewDidLoad can not perform segues
    // yani viewDidLoad fonksiyonu ekranlar arasındaki geçisi yapamaz
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // uygulamayı silsen bile keychain sayesinde adam login ise gene sisteme giriş yapabiliyor :)
    override func viewDidAppear(_ animated: Bool) {
        
        if let _ = KeychainWrapper.standard.string(forKey: KEY_USER_ID) {
            
            print("Erkut : goToFeed view")
            self.performSegue(withIdentifier: "goToFeed", sender: self)
            
        } else {
            
            print("Erkut : Something goes wrong")
        }
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
                
                if let userObject = user {
                    
                    self.completeSignIn(input_userid: userObject.uid)
                    
                }
            }
        }
    }

    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error == nil {
                    
                    print("Erkut: email user authenticated with firebase")
                    print("info verified or not : \(String(describing: user?.isEmailVerified))")
                    
                    if let userObject = user {
                        
                        self.completeSignIn(input_userid: userObject.uid)
                        
                    }
                    
                } else {
                    
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        
                        if error != nil {
                            
                            if let errorMessage = error as NSError? {
                                
                                print("Erkut: createUser errorMessage :\(errorMessage)")
                                
                            }
                            
                        } else {
                            
                            print("Erkut : user email authentication is ok")
                            
                            if let userObject = user {
                                
                                self.completeSignIn(input_userid: userObject.uid)
                                
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(input_userid: String) {
        
        let keychainResult = KeychainWrapper.standard.set(input_userid, forKey: KEY_USER_ID)
        print("Erkut : data sadved to keychain : \(keychainResult)")
        self.performSegue(withIdentifier: "goToFeed", sender: self)

    }
}


























