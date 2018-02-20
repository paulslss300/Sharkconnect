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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var selectedClub: Club? = nil
    
    @IBOutlet weak var clubName: UILabel!
    
    @IBAction func suscribeButton(_ sender: Any) {
        
        var noDuplicate: Bool = false
        
        if subscribedClubs.isEmpty {
            subscribedClubs += [selectedClub!]
        } else {
            
            for club in subscribedClubs {
                if (selectedClub?.ClubNa)! != club.ClubNa {
                    noDuplicate = true
                } else {
                    noDuplicate = false
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
