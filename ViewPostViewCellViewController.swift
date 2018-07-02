//
//  ViewPostViewCellViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-06-03.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ViewPostViewCellViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.delegate = self
        postImage.dataSource = self
        postDescription.text = selectedPost?.postDe
        clubImage.image = selectedPost?.postImage
        postTitle.text = selectedPost?.postTi
        
        if selectedPost?.postDa != nil {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            postDate.text = dateFormatter.string(from: (selectedPost?.postDa)!)
        } else {
            postDate.isHidden = true
        }

        if (selectedPost?.postedImage.isEmpty)! {
            postImage.isHidden = true
        }
        if postTitle.text == "" {
            postTitle.isHidden = true
        }
        if postDescription.text == "" {
            postDescription.isHidden = true
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var selectedPost: Post? = nil
    
    @IBOutlet weak var clubImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var postImage: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (selectedPost?.postedImage.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageInPostAtViewPostVC", for: indexPath) as! PostedImageCVCellAtViewPostVC
        
        let image = (selectedPost?.postedImage)![indexPath.row]
        
        cell.postedImage.image = image
        
        return cell
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
