//
//  TwoVC.swift
//  QIYU-Demo
//
//  Created by 陈旭 on 2017/3/17.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class GoodsDetailsVC: UIViewController,QYConversationManagerDelegate {

    var buttonClicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("jinlail a a a a ")
        self.view.backgroundColor = UIColor.red
        
        QYSDK.shared().conversationManager().setDelegate(self)
        self.view.addSubview(WOWCustormMessageView.sharedInstance)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func onUnreadCountChanged(_ count: Int) {
        
       print("未读消息数量=======\(count)")
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(QYSDK.shared().conversationManager().allUnreadCount())
             let vc = WOWSesstionViewController.sharedInstance
         self.navigationController?.pushViewController(vc, animated: true)
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
