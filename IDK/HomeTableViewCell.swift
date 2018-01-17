//
//  HomeTableViewCell.swift
//  IDK
//
//  Created by Student on 2018-01-16.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {


    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
