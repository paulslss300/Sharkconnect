//
//  HomeTableViewCell.swift
//  IDK
//
//  Created by Student on 2018-01-16.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var imageList = [UIImage]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellPostedImage.dataSource = self
        cellPostedImage.delegate = self
    }

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UITextView! 
    @IBOutlet weak var cellIdentifier: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var labelOverImage: UILabel!
    @IBOutlet weak var cellPostedImage: UICollectionView!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageInPostNormal", for: indexPath) as! PostedImageCollectionViewCellForNormal
        
        let image = imageList[indexPath.row]
        
        cell.postedImage.image = image
        
        return cell
    }
    
}
