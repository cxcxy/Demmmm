//
//  WOWCustormMessageView.swift
//  aaa
//
//  Created by 陈旭 on 2017/4/14.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class WOWCustormMessageView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.orange
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
class LoadView {
    
    static let sharedInstance: WOWCustormMessageView = {
        let instance = WOWCustormMessageView()
        instance.frame = UIScreen.main.bounds
        
        return instance
    }()
    
    static func show() -> UIView{
        sharedInstance.alpha = 1.0
        return sharedInstance
    }
    
    static func dissMissView()  {
        
        UIView.animate(withDuration: 0.8, animations: {
            
            sharedInstance.alpha = 0.0
            
        }, completion: { (true) in
            
            sharedInstance.removeFromSuperview()
        })
    }
}

