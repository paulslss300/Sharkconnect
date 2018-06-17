//  CalendarCollectionViewCell.swift
//  calendarTest
//
//  Created by Guest User on 2018-03-07.
//  Copyright © 2018 Guest User. All rights reserved.
//

import UIKit

class CalendarCVCell: UICollectionViewCell {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var image2: UIImageView!
}

