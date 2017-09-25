//
//  FourViewController.swift
//  swift-BaseMask
//
//  Created by 陈旭 on 2017/5/23.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class FourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
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
