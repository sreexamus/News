//
//  NewDetailsTableViewCell.swift
//  AllNews
//
//  Created by sreekanth reddy iragam reddy on 8/4/17.
//  Copyright © 2017 com.sree.objc. All rights reserved.
//

import UIKit

class NewDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
