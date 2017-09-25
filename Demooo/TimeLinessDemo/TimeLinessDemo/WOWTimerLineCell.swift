//
//  WOWTimerLineCell.swift
//  TimeLinessDemo
//
//  Created by 陈旭 on 2017/5/9.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class WOWTimerLineCell: UITableViewCell {
    @IBOutlet weak var lbApply: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    open var timelinePoint = TimelinePoint() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    open var timeline = Timeline() {
        didSet {
            self.setNeedsDisplay()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        draw_dashed_line(UIColor.red)
    }
    func draw_dashed_line( _ color:UIColor ){
        
        //画虚线
        let dotteShapLayer = CAShapeLayer()
        let mdotteShapePath = CGMutablePath()
        dotteShapLayer.fillColor = UIColor.clear.cgColor
        dotteShapLayer.strokeColor = color.cgColor
        dotteShapLayer.lineWidth = 1
        
        
        mdotteShapePath.move(to: CGPoint(x:0,y:20))
        mdotteShapePath.addLine(to: CGPoint(x:350,y:20))
        dotteShapLayer.path = mdotteShapePath
        let arr :NSArray = NSArray(array: [2,2])
        dotteShapLayer.lineDashPhase = 1.0
        dotteShapLayer.lineDashPattern = arr as? [NSNumber]
        self.layer.addSublayer(dotteShapLayer)
        
    }
    override open func draw(_ rect: CGRect) {
        for layer in self.contentView.layer.sublayers! {
            if layer is CAShapeLayer {
                layer.removeFromSuperlayer()
            }
        }
        
        timelinePoint.position = CGPoint(x: timeline.leftMargin + timeline.width / 2, y: lbApply.frame.origin.y + lbApply.intrinsicContentSize.height / 2 - timelinePoint.diameter / 2)
        
        timeline.start = CGPoint(x: timelinePoint.position.x + timelinePoint.diameter / 2, y: 0)
        timeline.middle = CGPoint(x: timeline.start.x, y: timelinePoint.position.y)
        timeline.end = CGPoint(x: timeline.start.x, y: self.bounds.size.height)
        timeline.draw(view: self.contentView)
        
        timelinePoint.draw(view: self.contentView)
        
        //
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
