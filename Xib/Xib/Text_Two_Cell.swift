//
//  Text_Two_Cell.swift
//  Xib
//
//  Created by 陈旭 on 2017/8/25.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class Text_Two_Cell: UITableViewCell {

    @IBOutlet weak var view_o: UIView!
    @IBOutlet weak var view_t: UIView!
    @IBOutlet weak var view_three: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        view_t.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
