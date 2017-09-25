//
//  BrandBottomLookMoreView.swift
//  Tab
//
//  Created by 陈旭 on 2017/8/4.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
typealias WOWActionClosure         = () -> ()

class BrandBottomLookMoreView: UIView {

    @IBOutlet weak var view: UIView!
 
    var block:WOWActionClosure?
    
    @IBAction func LookAction(_ sender: Any) {
        print("点击")
        if let block = block {
            block()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.view.frame = self.bounds
    }
    func setup() {
        _ = Bundle.main.loadNibNamed("BrandBottomLookMoreView", owner: self, options: nil)?.last
        
        self.addSubview(self.view)
//        self.view.frame = self.bounds
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
