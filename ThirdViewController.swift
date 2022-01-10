//
//  ThirdViewController.swift
//  IDK
//
//  Created by Student on 2018-02-06.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginUserName: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var studentLoginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        var loginSuccessful: Bool = false
        
        guard let username = loginUserName.text else {
            studentLoginLabel.text = "Input Account Name"
            return
        }
        
        guard let password = loginPassword.text else {
            studentLoginLabel.text = "Input Account Password"
            return
        }
        
        for studentAccount in students {
            if username == studentAccount.StudentNa && password == studentAccount.StudentPa {
                loginSuccessful = true
                userId = "studentRandomNumber10382"
                loggedInStudent = studentAccount
                break
                
            } else {
                loginSuccessful = false
            }
        }
        
        if loginSuccessful {
        
            // Store username, password, loggedInAsClub
            let keychain = KeychainSwift()
            keychain.set(username, forKey: "username")
            keychain.set(password, forKey: "password")
            UserDefaults.standard.set(false, forKey: "loggedInAsClub")
            UserDefaults.standard.set(true, forKey: "status")

            
            guard let loggedInStudent = loggedInStudent else {
                return
            }
            
            // add school (only works once)
            if (loggedInStudent.subscribedClubs).isEmpty {
                for club in clubs {
                    if club.ClubNa == "School" {
                        loggedInStudent.subscribedClubs += [club]
                    }
                }
            }
            // add subscribed posts
            for post in Post.posts {
                for club in (loggedInStudent.subscribedClubs) {
                    if post.clubIdentifier == club.ClubNa {
                        subscribedPosts += [post]
                    }
                }
            }
            Switcher.updateRootVC()
            
        } else {
            studentLoginLabel.text = "Please Check Your Inputs Are Correct!"
        }

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.layer.shadowOpacity = 0.6
        loginButton.layer.shadowRadius = 6
        loginButton.layer.shadowOffset = CGSize(width: 4, height: 2)
        
        studentLoginLabel.text = ""
        self.userName.delegate = self
        self.password.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
