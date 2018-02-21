//
//  ImageImporterViewController.swift
//  IDK
//
//  Created by launchpad on 2018-02-11.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ImageImporterViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    let image = UIImagePickerController()
    
    @IBOutlet weak var clubDescription: UITextView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func importImage(_ sender: Any) {
        image.delegate = self
        
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After it is complete
        }
        
    }
    
    @IBAction func setDescription(_ sender: Any) {
        MyDescription = clubDescription.text
    }
    
    @IBAction func setAvatar(_ sender: Any) {
        myAvatar = myImageView.image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            myImageView.image = image
        }else{
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //myImageView.image = myAvatar

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
