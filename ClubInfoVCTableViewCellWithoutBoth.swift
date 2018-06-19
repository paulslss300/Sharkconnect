//
//  ClubInfoVCTableViewCellWithoutBoth.swift
//  IDK
//
//  Created by Paul Tang on 2018-06-17.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ClubInfoVCTableViewCellWithoutBoth: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDate: UILabel!

}
