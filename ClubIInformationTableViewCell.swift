//
//  ClubIInformationTableViewCell.swift
//  IDK
//
//  Created by Paul Tang on 2018-06-02.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class ClubIInformationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postDescription: UITextView!

}
