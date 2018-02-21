//
//  ClubInformationViewController.swift
//  IDK
//
//  Created by Student on 2018-02-13.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ClubInformationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clubName.text = selectedClub?.ClubNa
        clubDe.text = selectedClub?.ClubDe
        clubCoverImage.image = selectedClub?.ClubCellCoverImage
        clubImage.image = selectedClub?.ClubCellImageName
        subscribeButton.layer.cornerRadius = 6.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var selectedClub: Club? = nil
    
    @IBOutlet weak var subscribeButton: UIButton!
    
    @IBOutlet weak var clubName: UILabel!
    
    @IBOutlet weak var clubDe: UITextView!
    
    @IBOutlet weak var clubCoverImage: UIImageView!
    
    @IBOutlet weak var clubImage: UIImageView!
    
    @IBAction func suscribeButton(_ sender: Any) {
        
        //sender.isSelected = !sender.isSelected
        
        var noDuplicate: Bool = false
        
        
        if subscribedClubs.isEmpty {
            subscribedClubs += [selectedClub!]
        } else {
            
            for club in subscribedClubs {
                if (selectedClub?.ClubNa)! != club.ClubNa {
                    noDuplicate = true
                } else {
                    noDuplicate = false
                    subscribedClubs = subscribedClubs.filter({ (club) -> Bool in
                        return !(club.ClubNa == selectedClub?.ClubNa)
                    })
                }
            }
        }
        if noDuplicate {
            subscribedClubs += [selectedClub!]
        }
        
        
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
