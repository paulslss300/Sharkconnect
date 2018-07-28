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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        var clubLoginSuccessful: Bool = false
        
        guard let LoginTextField = LoginTextField.text else {
            clubLoginLabel.text = "Input Club Name"
            return
        }
        
        guard let passwordTextField = loginPassword.text else {
            clubLoginLabel.text = "Input Club Password"
            return
        }
        
        for clubAccount in clubs {
            if LoginTextField == clubAccount.ClubNa && passwordTextField == clubAccount.ClubPa {
                clubLoginSuccessful = true
                loggedInClub = clubAccount
                userId = LoginTextField
                break
            } else {
                clubLoginSuccessful = false
            }
        }


        if clubLoginSuccessful {
            loggedInAsClub = true
            
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
            performSegue(withIdentifier: "correctLogin", sender: self)
            
        } else {
            clubLoginLabel.text = "Please Check Your Inputs Are Correct!"
        }
        
    }


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



