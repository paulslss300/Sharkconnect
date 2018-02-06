//
//  CreatePostViewController.swift
//  IDK
//
//  Created by Student on 2018-01-23.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    var actualPostTitle: String = ""
    var actualPostDescription: String = ""
    var secondViewController = SecondViewController()
    
    @IBAction func createPostButton(_ sender: Any) {
        actualPostTitle = postTitle.text!
        actualPostDescription = postDescription.text!
        let post1 = Post(postTi: actualPostTitle, postDe: actualPostDescription, clubIdentifier: secondViewController.clubIdentifier)
        Post.posts += [post1]
    }
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDescription: UITextField!
    // Create a club object
    // Populate image, name and description
    // Return club object to previous view controller for display in table
    
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
