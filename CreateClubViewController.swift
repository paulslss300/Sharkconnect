//
//  CreateClubViewController.swift
//  IDK
//
//  Created by Student on 2018-01-31.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreateClubViewController: UIViewController {
    
    
    var actualClubName: String = ""
    var actualClubPassword: String = ""
    var createdClub: Bool = true
    
    
    @IBOutlet weak var ClubName: UITextField!
    @IBOutlet weak var ClubPassword: UITextField!
    
    @IBAction func CreateClubButton(_ sender: Any) {
        actualClubName = ClubName.text!
        actualClubPassword = ClubPassword.text!
        
        if actualClubName.isEmpty || actualClubPassword.isEmpty {
            createdClub = false
        } else {
            createdClub = true
        }
        
        // this is to populate the dictionary
        //without this, the for loop below won't work
        Club.clubs["TEST"] = "TEST"
        for (findLTextFieldValue, _) in Club.clubs {
            if actualClubName != findLTextFieldValue && createdClub {
               Club.clubs[actualClubName] = actualClubPassword
            }
        }
    }

        //createdClub = true
    


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