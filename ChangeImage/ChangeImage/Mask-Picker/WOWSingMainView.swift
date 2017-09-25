//
//  WOWSingMainView.swift
//  swift-BaseMask
//
//  Created by 陈旭 on 2017/9/7.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class WOWSingMainView: ETPopupView {

    @IBOutlet weak var lbSignContent: UILabel!

    @IBOutlet weak var lbSignNumber: UILabel!
    
    @IBOutlet weak var imgProgress: UIImageView!
    
    var contentStr: String = "每天可以积累签到1次，叠加好礼0元兑换\n双倍签到时间段：国庆节活动期间\n09。30-10。09 每日次数x2"
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbSignContent.text = contentStr
        animationDuration = 0.3
        self.snp.makeConstraints { (make) in
            make.width.equalTo(MGScreenWidth)
            make.height.equalTo(MGScreenHeight)
        }
        type = .alert
    }
    @IBAction func clickSignAction(_ sender: Any) {
        hide()
    }
    
    @IBAction func clooseAction(_ sender: Any) {
        
        hide()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
}
