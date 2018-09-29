//
//  SecondViewController.swift
//  IDK
//
//  Created by Student on 2018-01-09.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var clubLoginLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.layer.shadowOpacity = 0.6
        loginButton.layer.shadowRadius = 6
        loginButton.layer.shadowOffset = CGSize(width: 4, height: 2)
        
        clubLoginLabel.text = ""
    }

    @IBAction func logInButtonTapped(_ sender: UIButton) {
        
        guard let username = LoginTextField.text else {
            clubLoginLabel.text = "Input Club Name"
            return
        }
        
        guard let password = loginPassword.text else {
            clubLoginLabel.text = "Input Club Password"
            return
        }
        
        var clubLoginSuccessful: Bool = false
        
        for clubAccount in clubs {
            if username == clubAccount.ClubNa && password == clubAccount.ClubPa {
                clubLoginSuccessful = true
                loggedInClub = clubAccount
                userId = username
                break
            } else {
                clubLoginSuccessful = false
            }
        }
        
        if clubLoginSuccessful {
            
            let keychain = KeychainSwift()
            keychain.set(username, forKey: "username")
            keychain.set(password, forKey: "password")
            UserDefaults.standard.set(true, forKey: "loggedInAsClub")
            UserDefaults.standard.set(true, forKey: "status")
            
            guard let loggedInClub = loggedInClub else {
                return
            }
            
            // add school (only works once)
            if (loggedInClub.subscribedClubs).isEmpty {
                for club in clubs {
                    if club.ClubNa == "School" {
                        loggedInClub.subscribedClubs += [club]
                    }
                }
            }
            // add subscribed posts
            for post in Post.posts {
                for club in (loggedInClub.subscribedClubs) {
                    if post.clubIdentifier == club.ClubNa {
                        subscribedPosts += [post]
                    }
                }
            }
            Switcher.updateRootVC()
            
        } else {
            clubLoginLabel.text = "Please Check Your Inputs Are Correct!"
        }
    }


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



