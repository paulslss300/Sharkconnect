//
//  ClubInfoVCTableViewCellWithoutDescription.swift
//  IDK
//
//  Created by Paul Tang on 2018-06-17.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ClubInfoVCTableViewCellWithoutDescription: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var imageList = [UIImage]()

    override func awakeFromNib() {
        super.awakeFromNib()
        cellPostedImage.delegate = self
        cellPostedImage.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var cellPostedImage: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageInPostWithoutDescription", for: indexPath) as! PostedImageCVCellWithoutDescriptionAtClubInfoVC
        
        let image = imageList[indexPath.row]
        cell.postedImage.image = image
        
        return cell
    }

}
