//
//  ImageImporterViewController.swift
//  IDK
//
//  Created by launchpad on 2018-02-11.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ImageImporterViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var clubDescription: UITextView!
    @IBOutlet weak var borderForDescription: UIView!
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var borderForAvatar: UIView!
    
    @IBOutlet weak var myClubCoverView: UIImageView!
    @IBOutlet weak var borderForCover: UIView!
    
    var avatarButtonSelected = false
    
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        
        avatarButtonSelected = true
        
        self.present(image, animated: true)
        {
            //After it is complete
        }
        
    }
    
    @IBAction func importCover(_ sender: Any) {
        let imageCover = UIImagePickerController()
        imageCover.delegate = self
        imageCover.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imageCover.allowsEditing = false
        
        avatarButtonSelected = false
        
        self.present(imageCover, animated: true){
            //after it is complete
        }
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        // set description
        loggedInClub?.ClubDe = clubDescription.text
        
        // set avatar
        loggedInClub?.ClubCellImageName = myImageView.image
        
        for post in Post.posts {
            if post.clubIdentifier == loggedInClub?.ClubNa {
                post.postImage = myImageView.image
            }
        }
        
        // set cover image
        loggedInClub?.ClubCellCoverImage = myClubCoverView.image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            // The user has selected an image
            if avatarButtonSelected == true {
                myImageView.image = image

            }else {
                myClubCoverView.image = image
            }
            
        }else{
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = loggedInClub?.ClubCellImageName
        myClubCoverView.image = loggedInClub?.ClubCellCoverImage
        clubDescription.text = loggedInClub?.ClubDe
        myImageView.layer.cornerRadius = 48
        myImageView.layer.masksToBounds = true
        borderForAvatar.layer.cornerRadius = 48
        myClubCoverView.layer.cornerRadius = 30
        myClubCoverView.layer.masksToBounds = true
        borderForCover.layer.cornerRadius = 30
        clubDescription.layer.cornerRadius = 30
        borderForDescription.layer.cornerRadius = 30

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //myImageView.image = myAvatar
        //myClubCoverView.image = myClubCover
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
