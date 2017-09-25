//
//  TwoTestViewController.swift
//  PhotoTweaks-Demo
//
//  Created by 陈旭 on 2017/4/1.
//  Copyright © 2017年 陈旭. All rights reserved.
//
public class FNUtil {
    //获取当前页面
    public class func currentTopViewController() -> UIViewController {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        return currentTopViewController(rootViewController: rootViewController!)
    }
    
    public class func currentTopViewController(rootViewController: UIViewController) -> UIViewController {
        if (rootViewController.isKind(of: UITabBarController.self)) {
            let tabBarController = rootViewController as! UITabBarController
            return currentTopViewController(rootViewController: tabBarController.selectedViewController!)
        }
        
        if (rootViewController.isKind(of: UINavigationController.self)) {
            let navigationController = rootViewController as! UINavigationController
            return currentTopViewController(rootViewController: navigationController.visibleViewController!)
        }
        
        if ((rootViewController.presentedViewController) != nil) {
            return currentTopViewController(rootViewController: rootViewController.presentedViewController!)
        }
        return rootViewController
    }
}
import UIKit

class TwoTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        //获取根VC
//        var rootVC = self.presentingViewController
//        while let parent = rootVC?.presentingViewController {
//            rootVC = parent
//        }
//        //释放所有下级视图
////        rootVC?.dismiss(animated: false, completion: nil)
//        rootVC?.dismiss(animated: false, completion: {
//              rootVC?.navigationController?.popViewController(animated: true)
//        })
      
        self.dismiss(animated: false) {
          _ = FNUtil.currentTopViewController().navigationController?.popViewController(animated: true)
        }
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
