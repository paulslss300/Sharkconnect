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
        actualClubPassword = ClubPassword.text!
        
        if ClubName.text!.isEmpty || actualClubPassword.isEmpty {
            createdClub = false
        } else {
            createdClub = true
        }
        
        
        // check 1
        for club in clubs {
            if ClubName.text! != club.ClubNa {
                checkClubName = true
            } else {
                checkClubName = false
            }
        }
        
        //check 2
        if !(ClubName.text!.isEmpty || actualClubPassword.isEmpty) && checkClubName {
            createdClub = true
        } else if ClubName.text!.isEmpty || actualClubPassword.isEmpty || !checkClubName {
            createdClub = false
        }

        
        //create new club
        if createdClub {
            let myAvatar = UIImage(named: "default")
            let myClubCover = UIImage(named: "defaultCoverImage")
            let myClub = Club.init(ClubNa: ClubName.text!, ClubPa: actualClubPassword, ClubDe: "No Description", ClubCellImageName: myAvatar!, ClubCellCoverImage: myClubCover!)
            clubs += [myClub]
            
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
