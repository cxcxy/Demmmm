//
//  BaseViewController.swift
//  NoNetWorking
//
//  Created by 陈旭 on 2016/12/26.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
class BaseViewController: UIViewController,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - DZNEmptyDataSetDelegate,DZNEmptyDataSetSource
//    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
//        return UIImage()
//    }
//    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
//        
//        return NSAttributedString.init(string: "hhaadfaffaha", attributes: nil)
//    }
//
////    func customView(forEmptyDataSet scrollView: UIScrollView!) -> UIView! {
////       let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
////        view.backgroundColor = UIColor.red
////        return view
////    }
//    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView!) -> Bool {
//        return true
//    }
//    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
//        print("ccc")
//    }
//    func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> UIImage! {
//        
//    }
//    func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
//        
//    }
//    func emptyDataSetShouldFade(in scrollView: UIScrollView!) -> Bool {
//        return false
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
