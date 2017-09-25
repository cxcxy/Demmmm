//
//  ThreeViewController.swift
//  WOWMenuDemo
//
//  Created by 陈旭 on 2017/5/25.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {
    var selectIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        switch selectIndex {
        case 0:
              self.view.backgroundColor = UIColor.blue
        case 1:
              self.view.backgroundColor = UIColor.red
        case 2:
            self.view.backgroundColor = UIColor.yellow
        case 3:
            self.view.backgroundColor = UIColor.orange
        default:
             self.view.backgroundColor = UIColor.gray
        }
//        self.view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
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
