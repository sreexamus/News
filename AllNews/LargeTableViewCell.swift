//
//  LargeTableViewCell.swift
//  AllNews
//
//  Created by sreekanth reddy iragam reddy on 7/26/17.
//  Copyright © 2017 com.sree.objc. All rights reserved.
//

import UIKit

class LargeTableViewCell: UITableViewCell {

    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
