//
//  CreateStudentAccountViewController.swift
//  IDK
//
//  Created by Student on 2018-02-05.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreateStudentAccountViewController: UIViewController {
    
    
    var actualStudentName: String = ""
    var actualStudentPassword: String = ""
    var createdStudent: Bool = false
    var checkStudentName: Bool = false
    
    @IBOutlet weak var createdStudentLabel: UILabel!
    @IBOutlet weak var StudentName: UITextField!
    @IBOutlet weak var StudentPassword: UITextField!
    
    @IBAction func CreateStudentButton(_ sender: Any) {
        actualStudentName = StudentName.text!
        actualStudentPassword = StudentPassword.text!
        
        // this is to populate the dictionary
        //without this, feature won't work
        Student.students["this is supposed to be a very long string"] = "this is supposed to be a very long string"
        
        // check 1
        for (findLTextFieldValue, _) in Student.students {
            if actualStudentName != findLTextFieldValue {
                checkStudentName = true
            } else if actualStudentName == findLTextFieldValue {
                checkStudentName = false
            }
        }
        
        //check 2
        if !(actualStudentName.isEmpty || actualStudentPassword.isEmpty) && checkStudentName {
            createdStudent = true
        } else if actualStudentName.isEmpty || actualStudentPassword.isEmpty || !checkStudentName {
            createdStudent = false
        }
        
        //create student account
        if createdStudent {
            Student.students[actualStudentName] = actualStudentPassword
            createdStudentLabel.text! = "Account Created!"
        } else {
            createdStudentLabel.text! = "Please Change a User Name or Password!"
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
