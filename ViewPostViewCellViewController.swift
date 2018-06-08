//
//  ViewPostViewCellViewController.swift
//  IDK
//
//  Created by Paul Tang on 2018-06-03.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ViewPostViewCellViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        postDescription.text = selectedPost?.postDe
        clubImage.image = selectedPost?.postImage
        postTitle.text = selectedPost?.postTi
        postImage.image = selectedPost?.postedImage
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        postDate.text = dateFormatter.string(from: (selectedPost?.postDa)!)
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
    @IBOutlet weak var postImage: UIImageView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
