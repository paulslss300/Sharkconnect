//
//  CreateStudentAccountViewController.swift
//  IDK
//
//  Created by Student on 2018-02-05.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreateStudentAccountViewController: UIViewController {
    
    @IBOutlet weak var createdStudentLabel: UILabel!
    @IBOutlet weak var StudentName: UITextField!
    @IBOutlet weak var StudentPassword: UITextField!
    
    @IBAction func CreateStudentButton(_ sender: Any) {
        
        var createdStudent: Bool = false
        
        guard let inputName = StudentName.text, !(inputName.trimmingCharacters(in: .whitespaces).isEmpty) else {
            createdStudentLabel.text = "Change Your Account Name!"
            return
        }
        
        guard let inputPW = StudentPassword.text, !(inputPW.trimmingCharacters(in: .whitespaces).isEmpty) else {
            createdStudentLabel.text = "Change Your Password!"
            return
        }
        
        for student in students {
            if student.StudentNa == inputName {
                createdStudent = false
                break
            } else {
                createdStudent = true
            }
        }

        //create student account
        if createdStudent {
            
            let newStudent = Student.init(StudentNa: inputName, StudentPa: inputPW)
            students += [newStudent]
            createdStudentLabel.text = "Account Created!"
        } else {
            createdStudentLabel.text = "Account Name Taken!"
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
