//  CalendarTableViewCell.swift
//  calendarTest
//
//  Created by Student on 2018-03-09.
//  Copyright © 2018 Guest User. All rights reserved.
//

import UIKit

class CalendarTVCell: UITableViewCell {
    
    @IBOutlet weak var postDescription: UILabel!
    
    @IBOutlet weak var clubName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

