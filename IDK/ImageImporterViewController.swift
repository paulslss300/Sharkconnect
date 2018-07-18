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
    
    @IBAction func setDescription(_ sender: Any) {
        MyDescription = clubDescription.text
        for club in Club.clubs {
            if club.ClubNa == actualClubName {
                club.ClubDe = clubDescription.text
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            // The user has selected an image
            if avatarButtonSelected == true{
                myImageView.image = image
                
                for club in Club.clubs {
                    if club.ClubNa == actualClubName {
                        club.ClubCellImageName = myImageView.image
                    }
                }
                for post in Post.posts {
                    if post.clubIdentifier == actualClubName {
                        post.postImage = myImageView.image
                        myAvatar = myImageView.image
                    }
                }

            }else {
                myClubCoverView.image = image
                
                for club in Club.clubs {
                    if club.ClubNa == actualClubName {
                        club.ClubCellCoverImage = myClubCoverView.image
                    }
                }

            }
            
        }else{
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = myAvatar
        myImageView.layer.cornerRadius = 48
        myImageView.layer.masksToBounds = true
        borderForAvatar.layer.cornerRadius = 48
        myClubCoverView.image = myClubCover
        myClubCoverView.layer.cornerRadius = 30
        myClubCoverView.layer.masksToBounds = true
        borderForCover.layer.cornerRadius = 30

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
