//
//  FirstViewController.swift
//  IDK
//
//  Created by Student on 2018-01-09.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var selectedSchool: School? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentLogin.layer.cornerRadius = 10.0
        clubLogin.layer.cornerRadius = 10.0
        schoolName.text = selectedSchool?.SchoolNa
    }

    @IBOutlet weak var clubLogin: UIButton!
    @IBOutlet weak var studentLogin: UIButton!
    @IBOutlet weak var schoolName: UILabel!
    
    @IBAction func unwindToFirst(segue: UIStoryboardSegue) {
        // This is the target when performing an unwind segue all the way back here as a result of logout
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

