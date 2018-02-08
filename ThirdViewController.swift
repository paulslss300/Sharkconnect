//
//  ThirdViewController.swift
//  IDK
//
//  Created by Student on 2018-02-06.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var loginUserName: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var studentLoginLabel: UILabel!
    
    var loginTextFieldText: String = ""
    var passwordTextFieldText: String = ""
    var loginSuccessful: Bool = false
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {

        loginTextFieldText = loginUserName.text!
        passwordTextFieldText = loginPassword.text!
        
        for studentAccount in Student.students {
            if loginTextFieldText == studentAccount.StudentNa && passwordTextFieldText == studentAccount.StudentPa {
                loginSuccessful = true
            } else {
                loginSuccessful = false
            }
        }
        
        if loginSuccessful {
            performSegue(withIdentifier: "studentCorrectLogin", sender: self)
        } else {
            studentLoginLabel.text! = "Please Check Your Inputs Are Correct!"
        }

    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
