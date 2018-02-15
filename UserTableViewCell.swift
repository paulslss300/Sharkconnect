//
//  UserTableViewCell.swift
//  IDK
//
//  Created by Student on 2018-01-22.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
