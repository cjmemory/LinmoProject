//
//  QueryResultCell.swift
//  linmo
//
//  Created by Jie on 2/13/15.
//  Copyright (c) 2015 Jie. All rights reserved.
//

import UIKit

class QueryResultCell: UITableViewCell {

    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userage: UILabel!
    @IBOutlet weak var selectPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let theWidth = UIScreen.mainScreen().bounds.width
        
        contentView.frame = CGRectMake(0, 0, theWidth, 80)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
