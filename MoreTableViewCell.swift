//
//  MoreTableViewCell.swift
//  IDK
//
//  Created by Paul Tang on 2018-05-16.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var noteContent: UITextView!
    @IBOutlet weak var noteDate: UITextField!
}
