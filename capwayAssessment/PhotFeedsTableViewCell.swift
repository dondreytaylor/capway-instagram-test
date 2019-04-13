//
//  PhotFeedsTableViewCell.swift
//  capwayAssessment
//
//  Created by Ronald Jones on 4/11/19.
//  Copyright © 2019 Ron Jones Jr. All rights reserved.
//

import UIKit

class PhotFeedsTableViewCell: UITableViewCell {

    @IBOutlet weak var storyPic: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var bord: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
