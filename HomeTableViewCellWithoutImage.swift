//
//  HomeTableViewCellWithoutImage.swift
//  IDK
//
//  Created by Paul Tang on 2018-06-11.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class HomeTableViewCellWithoutImage: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDescription: UITextView!
    @IBOutlet weak var cellIdentifier: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var labelOverImage: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
