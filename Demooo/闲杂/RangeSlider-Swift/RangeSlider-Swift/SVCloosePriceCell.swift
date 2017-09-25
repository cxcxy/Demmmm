//
//  SVCloosePriceCell.swift
//  wowdsgn
//
//  Created by 陈旭 on 2017/1/10.
//  Copyright © 2017年 g. All rights reserved.
//

import UIKit
import SnapKit
//301 一级分类 场景
class CloosePriceCell: UITableViewCell,NHRangeSliderViewDelegate{
    
    var heightAll:CGFloat = CGFloat.leastNormalMagnitude
    
    let sliderCustomStringView = NHRangeSliderView()
    
    
    override init(style: UITableViewCellStyle,reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUI(){
        contentView.backgroundColor = UIColor.red
        sliderCustomStringView.frame =  CGRect(x: 0, y:  0, width: 270, height: 20)
        sliderCustomStringView.center = contentView.center
        sliderCustomStringView.trackHighlightTintColor = UIColor.black
        sliderCustomStringView.backgroundColor = UIColor.white
        sliderCustomStringView.lowerValue = 0.0
        sliderCustomStringView.upperValue = 100.0
        sliderCustomStringView.rangeSlider?.frame = CGRect(x: 0, y:  0, width: 270, height: 6)
        //        sliderCustomStringView.stepValue = 14.5
        let array = ["0","100","200","300","500","1000","2000","2500","2500","2500"]
        sliderCustomStringView.dataArray = array
        sliderCustomStringView.gapBetweenThumbs = 10
           sliderCustomStringView.delegate = self
        sliderCustomStringView.thumbLabelStyle = .FOLLOW
        
      
        
       contentView.addSubview(sliderCustomStringView)
        
//        sliderCustomStringView.snp.makeConstraints { (make) in
//            
//            make.left.equalTo(15)
//            make.right.equalTo(-15)
////            make.top.equalTo(15)
//            make.height.equalTo(20)
//            make.top.equalTo(self)
//            
//        }
        sliderCustomStringView.sizeToFit()
        sliderCustomStringView.layoutSubviews()
        sliderCustomStringView.setNeedsLayout()
        sliderCustomStringView.setNeedsDisplay()
        sliderCustomStringView.setNeedsLayout()
        sliderCustomStringView.layoutIfNeeded()

        self.layoutIfNeeded()
        
        self.setNeedsLayout()
        self.setNeedsDisplay()
        self.setNeedsLayout()
        
    }
    func sliderValueChanged(slider: NHRangeSlider?){
        //        if (sliderCustomStringView.upperLabel?.text?.contains("+"))! {
        //            sliderCustomStringView.upperLabel?.text?.remove(at: "+")
        //        }
        
        //        let a = Int(round((slider?.lowerValue)! / sliderCustomStringView.stepValue! ))
        //        let b = Int(round((slider?.upperValue)! / sliderCustomStringView.stepValue! ))
        
        let a  = Int(round((slider?.lowerValue)! / (sliderCustomStringView.stepValue ?? 0.0)))
        let b  = Int(round((slider?.upperValue)! / (sliderCustomStringView.stepValue ?? 0.0)))
        
        //        modelPrice.minPrice = priceDataArray[a].toSting()
        //        sliderCustomStringView.lowerLabel?.text?.toInt()
        
    }

    
}

class SVCloosePriceCell: UITableViewCell,UITextFieldDelegate,NHRangeSliderViewDelegate {

    var sliderCustomStringView: NHRangeSliderView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        minTextF.delegate = self
//        maxTextF.delegate = self
        
        sliderCustomStringView = NHRangeSliderView(frame: CGRect(x: 0, y:  0,
                                                                                                                                      width: 270,
                                                                                 height: 20) )
        sliderCustomStringView.trackHighlightTintColor = UIColor.black
        sliderCustomStringView.lowerValue = 0.0
        sliderCustomStringView.upperValue = 100.0
        //        //        sliderCustomStringView.stepValue = 14.5
        let array = ["0","100","200","300","500","1000","2000","2500"]
        sliderCustomStringView.dataArray = array
        sliderCustomStringView.gapBetweenThumbs = 10
   
        sliderCustomStringView.delegate = self
        sliderCustomStringView.thumbLabelStyle = .FOLLOW
        //
//        sliderCustomStringView.sizeToFit()
        self.contentView.addSubview(sliderCustomStringView)
        //
//        sliderCustomStringView.snp.makeConstraints {[unowned self] (make) in
//            make.left.right.equalTo(15)
//            make.top.equalTo(15)
//            make.height.equalTo(20)
//            
//        }
//
        
        // Initialization code
    }
//    func sliderValueChanged(slider: NHRangeSlider?){
//        //        if (sliderCustomStringView.upperLabel?.text?.contains("+"))! {
//        //            sliderCustomStringView.upperLabel?.text?.remove(at: "+")
//        //        }
//        
//        //        let a = Int(round((slider?.lowerValue)! / sliderCustomStringView.stepValue! ))
//        //        let b = Int(round((slider?.upperValue)! / sliderCustomStringView.stepValue! ))
//        
//        let a  = Int(round(sliderCustomStringView.lowerValue / (sliderCustomStringView.stepValue ?? 0.0)))
//        let b  = Int(round(sliderCustomStringView.upperValue / (sliderCustomStringView.stepValue ?? 0.0)))
//        
//        //        modelPrice.minPrice = priceDataArray[a].toSting()
//        //        sliderCustomStringView.lowerLabel?.text?.toInt()
// 
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  }
