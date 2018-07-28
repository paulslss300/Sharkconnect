//
//  CreatePostViewController.swift
//  IDK
//
//  Created by Student on 2018-01-23.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let picker = UIDatePicker()
    
    var actualDatePicked: Date? = nil
    
    var imagesInPost = [UIImage]()
    
    let homeVCCell = HomeTableViewCell()    //access the constraint from here
    
    @IBAction func createPostButton(_ sender: Any) {
        
        if postDescription.text == "Add A Description" && postDescription.textColor == UIColor.lightGray {
            postDescription.text = ""
        }
        
        guard let postImage = loggedInClub?.ClubCellImageName else {
            return
        }

        let post1 = Post(postTi: postTitle.text!, postDe: postDescription.text!, clubIdentifier: userId, postImage: postImage, postDa: actualDatePicked, postedImage: imagesInPost)
        Post.posts.insert(post1, at: 0)
        
       performSegue(withIdentifier: "unwindToTabBar", sender: self)
    }
    
    @IBOutlet weak var postTitle: UITextField!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postImageCV: UICollectionView!
    
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
                imagesInPost += [myPostImage]
                postImageCV.reloadData()
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        postDescription.delegate = self
        postDescription.text = "Add A Description"
        postDescription.textColor = UIColor.lightGray
        postImageCV.delegate  = self
        postImageCV.dataSource = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = imagesInPost[indexPath.row]
        imagesInPost = imagesInPost.filter({$0 != image})
        postImageCV.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesInPost.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageInPost", for: indexPath) as? ImageInPostCollectionViewCell {

            let image = imagesInPost[indexPath.row]
        
            cell.postImage.image = image
 
            return cell
            
        } else {
            assertionFailure("Failed to deque cell")
            return UICollectionViewCell()
        }
    }
    
    func textViewDidBeginEditing(_ postDescription: UITextView) {
        if postDescription.textColor == UIColor.lightGray {
            postDescription.text = nil
            postDescription.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ postDescription: UITextView) {
        if postDescription.text.isEmpty {
            postDescription.text = "Add A Description"
            postDescription.textColor = UIColor.lightGray
        }
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
