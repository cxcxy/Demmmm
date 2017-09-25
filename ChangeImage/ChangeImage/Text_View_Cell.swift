//
//  Text_View_Cell.swift
//  Tab
//
//  Created by 陈旭 on 2017/8/9.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
typealias WOWProductIdClosure         = (_ productId: Int) -> ()
class Text_View_Cell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
//      var prodductId_block :  (_ id:Int?) -> () =  () -> ()
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        block(1)
//        let b = UIDevice
        if UIDevice.is_X(){
            
            
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UIDevice{
    public static func is_X() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        
        return false
    }
}
