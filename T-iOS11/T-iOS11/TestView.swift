//
//  TestView.swift
//  T-iOS11
//
//  Created by 陈旭 on 2017/9/19.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class TestView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension UIView: NibLoadable {
}
protocol NibLoadable {
    
}
extension NibLoadable where Self: UIView {
    
    static func loadFromNib() -> Self{
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
}
