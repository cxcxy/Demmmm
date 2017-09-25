//
//  CVTableViewCell.swift
//  RangeSlider-Swift
//
//  Created by 陈旭 on 2017/2/23.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class SectionBannerModel: NSObject {
    var BannerImg : String?
    var isOut :Bool?
    
    init(BannerImg : String ,isOut :Bool) {
        super.init()
        self.BannerImg = BannerImg
        self.isOut = isOut
    }
    

}

protocol Cell_Class_BannerDelegate:class{
    
    func updataTableViewCellHight()
    
}
class Cell_Class_Banner: UITableViewCell {
    
    var itemWidthNumber : CGFloat =  50
        
  
    let itemWidth : CGFloat = MGScreenWidth - 30 - 20 * 2 / 3
//    let itemSize  :CGSize = CGSize(width: itemWidth,height: itemWidth)
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate : Cell_Class_BannerDelegate?
    var dataArray : [SectionBannerModel] = []{
        didSet{
//            heightConstraint.constant = CGFloat(dataArray.count * 100)
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for _ in 0..<5 {
            let model = SectionBannerModel.init(BannerImg: "", isOut: false)
            dataArray.append(model)
        }
        
        collectionView.register(UINib.nibName("Cell_Item_Class"), forCellWithReuseIdentifier: "Cell_Item_Class")
        collectionView.register(UINib.nibName("Cell_Banner_Class"), forCellWithReuseIdentifier: "Cell_Banner_Class")
        
        collectionView.delegate     = self
        collectionView.dataSource   = self
        collectionView.showsVerticalScrollIndicator     = false
        collectionView.showsHorizontalScrollIndicator   = false


        
        
    }
    func updateCollectionViewHight(hight :CGFloat)  {

        self.heightConstraint.constant = hight
        if let del = self.delegate {
            del.updataTableViewCellHight()
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
public let MGScreenWidth:CGFloat = UIScreen.main.bounds.size.width
public let MGScreenHeight:CGFloat = UIScreen.main.bounds.size.height

extension Cell_Class_Banner:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let model = dataArray[section]
        guard model.isOut == true else {// 返回 0
            
            return 1
        }
        switch section {
        case 0:
            return 3 + 1
        case 1:
            return 4 + 1
        case 2:
            return 5 + 1
        case 3:
            return 6 + 1
        default:
            return 1
        }
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        switch indexPath.row {
        case 0:
            let cell            = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Cell_Banner_Class.self), for: indexPath) as! Cell_Banner_Class
        
                cell.imgBanner.addTapGesture(action: { (sender) in
                
                    let model = self.dataArray[indexPath.section]
                        if model.isOut == false {
                                model.isOut = true
                        }else{
                                model.isOut = false
                        }
                        let indexSet = IndexSet.init(integer: 0)
                        collectionView.reloadSections(indexSet)
//                        collectionView.reloadData()
                
                })

            self.updateCollectionViewHight(hight: self.collectionView.collectionViewLayout.collectionViewContentSize.height)
            
            return cell
            
        default:
            
            let cell            = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: Cell_Item_Class.self), for: indexPath) as! Cell_Item_Class
            
            self.updateCollectionViewHight(hight: self.collectionView.collectionViewLayout.collectionViewContentSize.height)
            
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if indexPath.row == 0 {
            return CGSize(width: MGScreenWidth,height: 100)
        }else {
            return CGSize(width: MGScreenWidth,height: 44)
        }
      
    }
    
    //第一个cell居中显示
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(0, 0,0, 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    
    }
    

}
