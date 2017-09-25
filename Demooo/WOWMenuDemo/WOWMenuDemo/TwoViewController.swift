//
//  TwoViewController.swift
//  WOWMenuDemo
//
//  Created by 陈旭 on 2017/5/25.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {
    var pageMenu:CAPSPageMenu?
    var controllerArray : [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "我的订单"
        
        let titleArray  = ["全部","待付款","待发货","待收货","待评论"]
        for index in 0..<titleArray.count {
            
            let orderListVC = ThreeViewController()
//            orderListVC.title = titleArray[index]
            orderListVC.selectIndex = index
            controllerArray.append(orderListVC)
//            orderListVC.parentNavigationController = self.navigationController
        }
        
        let itemWidth :CGFloat = 56

        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor.white),
            .menuHeight(40),
            .menuMargin(15),
            .menuItemFont(UIFont.systemFont(ofSize: 14)),
            .unselectedMenuItemLabelColor(UIColor.red),
            .menuItemWidth(itemWidth),
            .selectionIndicatorColor(UIColor.black),
            .selectedMenuItemLabelColor(UIColor.black),
            .menuItemSeparatorPercentageHeight(0.1),
            .bottomMenuHairlineColor(UIColor.black)
            
        ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 64, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        pageMenu?.viewBackgroundColor = UIColor.yellow
//        pageMenu?.delegate = self
        
        
        //        pageMenu!.currentPageIndex = selectCurrentIndex!
        pageMenu?.moveToPage(0)
        //        pageMenu!.startingPageForScroll = selectCurrentIndex!
       
        self.view.addSubview(pageMenu!.view)
        
//         self.tz_addPopGesture(to: pageMenu!.view)
        
        let item = UIBarButtonItem(image:UIImage(named: "nav_backArrow"), style:.plain, target: self, action:#selector(navBack))
        navigationItem.leftBarButtonItem = item
        
    }
    func navBack() {
        if let nav = self.navigationController {
            if nav.viewControllers.count > 3 {
                _ = navigationController?.popToViewController((navigationController?.viewControllers[3])!, animated: true)
            }else{
                _ = navigationController?.popViewController(animated: true)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
