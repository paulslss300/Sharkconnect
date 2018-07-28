//
//  CreateClubViewController.swift
//  IDK
//
//  Created by Student on 2018-01-31.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreateClubViewController: UIViewController {
    
    @IBOutlet weak var ClubName: UITextField!
    @IBOutlet weak var ClubPassword: UITextField!
    @IBOutlet weak var createdClubLabel: UILabel!
    
    @IBAction func CreateClubButton(_ sender: Any) {
        
        var createdClub: Bool = false

        guard let inputName = ClubName.text, !(inputName.trimmingCharacters(in: .whitespaces).isEmpty) else {
            createdClubLabel.text = "Change Your Club Name!"
            return
        }
        
        guard let inputPW = ClubPassword.text, !(inputPW.trimmingCharacters(in: .whitespaces).isEmpty) else {
            createdClubLabel.text = "Change Your Password!"
            return
        }
        
        for club in clubs {
            if club.ClubNa == inputName {
                createdClub = false
                break
            } else {
                createdClub = true
            }
        }

        //create new club
        if createdClub {
            guard let myAvatar = UIImage(named: "default") else {
                createdClubLabel.text = "Failed to load default avatar"
                return
            }
            
            guard let myClubCover = UIImage(named: "defaultCoverImage") else {
                createdClubLabel.text = "Failed to load default cover image"
                return
            }
            
            let myClub = Club.init(ClubNa: inputName, ClubPa: inputPW, ClubDe: "No Description", ClubCellImageName: myAvatar, ClubCellCoverImage: myClubCover)
            clubs += [myClub]
            
            createdClubLabel.text = "Account Created!"
            
        } else {
            createdClubLabel.text = "Club Name Taken!"
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
