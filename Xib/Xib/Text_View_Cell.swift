//
//  Text_View_Cell.swift
//  Tab
//
//  Created by 陈旭 on 2017/8/9.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

public let MGScreenWidth:CGFloat = UIScreen.main.bounds.size.width
public let MGScreenHeight:CGFloat = UIScreen.main.bounds.size.height
public let MGScreenWidthHalf:CGFloat = MGScreenWidth / 2
public let MGScreenHeightHalf:CGFloat = MGScreenHeight / 2

class Text_View_Cell: UITableViewCell {

  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
          draw_dashed_line(UIColor.red)
    }
    func draw_dashed_line( _ color:UIColor ){
        
        //画虚线
        let dotteShapLayer = CAShapeLayer()
        let mdotteShapePath = CGMutablePath()
        dotteShapLayer.fillColor = UIColor.clear.cgColor
        dotteShapLayer.strokeColor = color.cgColor
        dotteShapLayer.lineWidth = 1
        
        
        mdotteShapePath.move(to: CGPoint(x:15,y:0))
        mdotteShapePath.addLine(to: CGPoint(x:MGScreenWidth - 15,y:0))
        dotteShapLayer.path = mdotteShapePath
        let arr :NSArray = NSArray(array: [4,2])
        dotteShapLayer.lineDashPhase = 1.0
        dotteShapLayer.lineDashPattern = arr as? [NSNumber]
        self.layer.addSublayer(dotteShapLayer)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
