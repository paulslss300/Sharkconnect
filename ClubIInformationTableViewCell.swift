//
//  ClubIInformationTableViewCell.swift
//  IDK
//
//  Created by Paul Tang on 2018-06-02.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ClubIInformationTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    var imageList = [UIImage]()

    override func awakeFromNib() {
        super.awakeFromNib()
        postImage.delegate = self
        postImage.dataSource = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var postImage: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageInPostNormal", for: indexPath) as! PostedImageCVCellNormalAtClubInfoVC
        
        let image = imageList[indexPath.row]
        
        cell.postedImage.image = image
        
        return cell
    }

}
