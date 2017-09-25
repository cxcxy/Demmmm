//
//  TextDetailCell.swift
//  PhotoTweaks-Demo
//
//  Created by 陈旭 on 2017/3/24.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class TextDetailCell: UITableViewCell {

    @IBOutlet weak var stackHeight: NSLayoutConstraint!
    @IBOutlet weak var btnHeight: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnTest: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
