//
//  WOWBaseMackViewController.swift
//  MaskDemo
//
//  Created by 陈旭 on 2017/5/5.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    
    // presentViewController  使当前控制器 颜色透明
    func presentToMaskViewController(viewControllerToPresent:UIViewController,completion: (() -> Swift.Void)? = nil) {
        
        viewControllerToPresent.providesPresentationContextTransitionStyle = true
        
        viewControllerToPresent.definesPresentationContext = true

        viewControllerToPresent.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        self.present(viewControllerToPresent, animated: false, completion: completion)
        
    }
    
}
public let MGScreenWidth:CGFloat = UIScreen.main.bounds.size.width
public let MGScreenHeight:CGFloat = UIScreen.main.bounds.size.height
public let MGScreenWidthHalf:CGFloat = MGScreenWidth / 2
public let MGScreenHeightHalf:CGFloat = MGScreenHeight / 2



class WOWBaseMackViewController: UIViewController,CAAnimationDelegate {
    
    var containsView : UIView?
       
    lazy var btnDismiss: UIButton = {
        let btn = UIButton(frame:CGRect.init(x: 0, y: 0, width: MGScreenWidth, height: MGScreenHeight))
        btn.addTarget(self, action: #selector(dismissBtn), for: .touchUpInside)
        btn.alpha = 0
        btn.backgroundColor = UIColor.black
        return btn
    }()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(btnDismiss)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.1, animations: {
            self.btnDismiss.alpha = 0.5
            self.view.layoutIfNeeded()
        }) { (finished) in
            
           self.showView()
        }

    }
    func showView(){
        if let containsView = containsView {
            let animation = CATransition.init()
            animation.delegate = self
            animation.duration = 0.15
            animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = kCATransitionPush;
            animation.subtype = kCATransitionFromTop;
            containsView.layer.add(animation, forKey: "LocateViewTop")
            containsView.alpha = 1.0
            self.view.addSubview(containsView)
        }

    }
    func dissView(){
        
        if let containsView = containsView {
            let animation = CATransition.init()
            animation.delegate = self
            animation.duration = 0.15
            animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.type = kCATransitionPush;
            animation.subtype = kCATransitionFromBottom;
            containsView.layer.add(animation, forKey: "LocateViewTop")
            containsView.alpha = 0.0

        }
       
    }
    func dismissBtn()  {
        self.dissView()
        UIView.animate(withDuration: 0.1, animations: {
    
            self.btnDismiss.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { (finished) in
     
            self.dismiss(animated: false, completion: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
