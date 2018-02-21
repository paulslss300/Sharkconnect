//
//  CreateClubViewController.swift
//  IDK
//
//  Created by Student on 2018-01-31.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreateClubViewController: UIViewController {
    
    
    
    var createdClub: Bool = false
    var checkClubName: Bool = false
    
    @IBOutlet weak var ClubName: UITextField!
    @IBOutlet weak var ClubPassword: UITextField!
    @IBOutlet weak var createdClubLabel: UILabel!
    
    @IBAction func CreateClubButton(_ sender: Any) {
        actualClubName = ClubName.text!
        actualClubPassword = ClubPassword.text!
        
        if actualClubName.isEmpty || actualClubPassword.isEmpty {
            createdClub = false
        } else {
            createdClub = true
        }
        
        
        // check 1
        for club in Club.clubs {
            if actualClubName != club.ClubNa {
                checkClubName = true
            } else {
                checkClubName = false
            }
        }
        
        //check 2
        if !(actualClubName.isEmpty || actualClubPassword.isEmpty) && checkClubName {
            createdClub = true
        } else if actualClubName.isEmpty || actualClubPassword.isEmpty || !checkClubName {
            createdClub = false
        }

        
        //create new club
        if createdClub {
            myAvatar = UIImage(named: "default")
            myClubCover = UIImage(named: "defaultCoverImage")
            MyDescription = "No Description"
            let newClub = Club.init(ClubNa: actualClubName, ClubPa: actualClubPassword, ClubDe: MyDescription, ClubCellImageName: myAvatar!, ClubCellCoverImage: myClubCover!)
            Club.clubs += [newClub]
            
            createdClubLabel.text! = "Account Created!"
        } else {
            createdClubLabel.text! = "Please Change a User Name or Password!"
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
