//
//  SelectSchoolTableViewCell.swift
//  IDK
//
//  Created by Paul Tang on 2018-08-27.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class SelectSchoolTableViewCell: UITableViewCell {

    @IBOutlet weak var schoolImage: UIImageView!
    @IBOutlet weak var schoolNa: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
