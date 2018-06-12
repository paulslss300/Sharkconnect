//
//  CreatePostViewController.swift
//  IDK
//
//  Created by Student on 2018-01-23.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    let picker = UIDatePicker()
    
    var actualPostTitle: String = ""
    var actualPostDescription: String = ""
    var actualPostImage: UIImage? = nil
    var actualDatePicked: Date? = nil
    var actualPostedImagePicked: UIImage? = nil
    
    let homeVCCell = HomeTableViewCell()    //access the constraint from here
    
    @IBAction func createPostButton(_ sender: Any) {
        actualPostTitle = postTitle.text!
        actualPostDescription = postDescription.text!

        let post1 = Post(postTi: actualPostTitle, postDe: actualPostDescription, clubIdentifier: clubId, postImage: myAvatar!, postDa: actualDatePicked, postedImage: actualPostedImagePicked)
        Post.posts.insert(post1, at: 0)
        
       performSegue(withIdentifier: "unwindToTabBar", sender: self)
    }
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var postImageView: UIImageView!
    
    var settingPostImageButton = false
    
    @IBAction func importPostImage(_ sender: Any) {
        let postMainImage = UIImagePickerController()
        postMainImage.delegate = self
        postMainImage.sourceType = UIImagePickerControllerSourceType.photoLibrary
        postMainImage.allowsEditing = false
        
        settingPostImageButton = true
        
        self.present(postMainImage, animated: true){}
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let myPostImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            //the user has selected an image
            if settingPostImageButton == true{
                postImageView.image = myPostImage
                actualPostedImagePicked = postImageView.image
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
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
        
        actualDatePicked = picker.date
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
