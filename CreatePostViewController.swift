//
//  CreatePostViewController.swift
//  IDK
//
//  Created by Student on 2018-01-23.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    
    let picker = UIDatePicker()
    
    var actualPostTitle: String = ""
    var actualPostDescription: String = ""
    var actualPostImage: UIImage? = nil
    var actualDatePicked: String = ""
    
    @IBAction func createPostButton(_ sender: Any) {
        actualPostTitle = postTitle.text!
        actualPostDescription = postDescription.text!
        actualDatePicked = dateField.text!
        
        let post1 = Post(postTi: actualPostTitle, postDe: actualPostDescription, clubIdentifier: clubId, postImage: myAvatar!, postDa: actualDatePicked)
        Post.posts += [post1]
        
    }
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var dateField: UITextField!

    
    // Create a club object
    // Populate image, name and description
    // Return club object to previous view controller for display in table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
    }
    
    func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button for the toolbar
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        dateField.inputAccessoryView = toolbar
        dateField.inputView = picker
        
        //format picker for date
        picker.datePickerMode = .date
    }

    @objc func donePressed(){
        //format date
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let dateString = formatter.string(from: picker.date)
        
        dateField.text = "\(dateString)"
        self.view.endEditing(true)
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
