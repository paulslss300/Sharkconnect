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
        
        // check 1
        for student in students {
            if actualStudentName == student.StudentNa {
                checkStudentName = false
                break
            } else {
                checkStudentName = true
            }
        }

        //check 2
        if !(actualStudentName.isEmpty || actualStudentPassword.isEmpty) && checkStudentName {
            createdStudent = true
        } else {
            createdStudent = false
        }
        
        //create student account
        if createdStudent {
            let newStudent = Student.init(StudentNa: actualStudentName, StudentPa: actualStudentPassword)
            students += [newStudent]
            createdStudentLabel.text! = "Account Created!"
        } else {
            createdStudentLabel.text! = "Please Change a User Name or Password!"
        }
    
    }


    override func viewDidLoad() {
        super.viewDidLoad()

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
