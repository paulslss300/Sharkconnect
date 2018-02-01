//
//  SecondViewController.swift
//  IDK
//
//  Created by Student on 2018-01-09.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var createClubClass = CreateClubViewController()
    @IBOutlet weak var warningText: UILabel!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //if createClubClass.createdClub == true {}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        //if loginTextField.text == loginName && passwordTextField.text == password {
      //      performSegue(withIdentifier: "correctLogin", sender: self)
      //  }
        for (loginTextField.text!, passwordTextField.text!) in clubs {
            print("1")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

