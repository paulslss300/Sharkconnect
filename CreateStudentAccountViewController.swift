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
    
    @IBOutlet weak var StudentName: UITextField!
    @IBOutlet weak var StudentPassword: UITextField!
    
    @IBAction func CreateClubButton(_ sender: Any) {
        actualStudentName = StudentName.text!
        actualStudentPassword = StudentPassword.text!
        
        if actualStudentName.isEmpty || actualStudentPassword.isEmpty {
            createdStudent = false
        } else {
            createdStudent = true
        }
        
        // this is to populate the dictionary
        //without this, the for loop below won't work
        Student.students["TEST"] = "TEST"
        for (findLTextFieldValue, _) in Student.students {
            if actualStudentName != findLTextFieldValue && createdStudent {
                Student.students[actualStudentName] = actualStudentPassword
            }
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
