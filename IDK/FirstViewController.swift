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
        
        
        studentLogin.layer.cornerRadius = 10.0
        clubLogin.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var clubLogin: UIButton!
    @IBOutlet weak var studentLogin: UIButton!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

