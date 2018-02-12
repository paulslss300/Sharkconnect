//
//  DiscoverTableViewCell.swift
//  IDK
//
//  Created by Student on 2018-02-06.
//  Copyright © 2018 No Clue. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {

    @IBOutlet weak var clubCellLabel: UILabel!
    
    @IBOutlet weak var clubCellImage: UIImageView!
    
    @IBAction func subscribeButton(_ sender: Any) {
        //add the club this cell represents to subscribedClubs
        //display subscribedClubs at the user interface
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
