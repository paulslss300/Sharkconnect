//
//  MoreViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-05-01.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var slideMenu: UIView!
    @IBOutlet weak var slideMenuLeading: NSLayoutConstraint!
    
    var slideMenuShowing: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideMenu.layer.shadowOpacity = 1
        slideMenu.layer.shadowRadius = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slideMenuButton(_ sender: Any) {
        if slideMenuShowing {
            slideMenuLeading.constant = -260
            UIView.animate(withDuration: 0.2,
                           animations: {
                            self.view.layoutIfNeeded()
            })
        } else {
            slideMenuLeading.constant = 0
            UIView.animate(withDuration: 0.4,
                           animations: {
                self.view.layoutIfNeeded()
            })
        }
        slideMenuShowing = !slideMenuShowing
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
