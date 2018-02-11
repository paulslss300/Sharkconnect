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
    
    var loginTextFieldText: String = ""
    var passwordTextFieldText: String = ""
    var clubLoginSuccessful: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        loginTextFieldText = LoginTextField.text!
        passwordTextFieldText = loginPassword.text!
        
        for clubAccount in Club.clubs {
            if loginTextFieldText == clubAccount.ClubNa && passwordTextFieldText == clubAccount.ClubPa {
                clubLoginSuccessful = true
                clubId = loginTextFieldText
            } else {
                clubLoginSuccessful = false
            }
        }


        if clubLoginSuccessful {
            performSegue(withIdentifier: "correctLogin", sender: self)
        } else {
            clubLoginLabel.text! = "Please Check Your Inputs Are Correct!"
        }
        
    }


    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



