//
//  HomeTableViewCellWithoutDescription.swift
//  IDK
//
//  Created by Paul Tang on 2018-06-11.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class HomeTableViewCellWithoutDescription: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var imageList = [UIImage]()
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellIdentifier: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var labelOverImage: UILabel!
    @IBOutlet weak var cellPostedImage: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellPostedImage.delegate = self
        cellPostedImage.dataSource = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageInPostWithoutDescription", for: indexPath) as! PostedImageCollectionViewCellForWithoutDescription
        
        let image = imageList[indexPath.row]
        
        cell.postedImage.image = image
        
        return cell
    }


}
