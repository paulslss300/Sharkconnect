//
//  FirstViewController.swift
//  IDK
//
//  Created by Student on 2018-01-09.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        
        studentLogin.layer.cornerRadius = 10.0
        clubLogin.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var clubLogin: UIButton!
    @IBOutlet weak var studentLogin: UIButton!
    
    @IBAction func unwindToFirst(segue: UIStoryboardSegue) {
        // This is the target when performing an unwind segue all the way back here as a result of logout
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

