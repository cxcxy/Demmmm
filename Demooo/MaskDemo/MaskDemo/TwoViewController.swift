//
//  TwoViewController.swift
//  swift-BaseMask
//
//  Created by 陈旭 on 2017/5/23.
//  Copyright © 2017年 陈旭. All rights reserved.
//
struct WOWDelay {
    // delay -- 多少秒后结束 回掉
   static func start(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
}
import UIKit
import MapKit
import WebKit
class TwoViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
//    @IBOutlet weak var webView: UIWebView!

//    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.contentSize = CGSize.init(width: 1000, height: 0)
//        scrollView.backgroundColor = [UIColor cyanColor];
        // Do any additional setup after loading the view.
//        let mapView = MKMapView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
//        self.view.addSubview(webView)
//
//        self.tz_addPopGesture(to: webView)
//        
//        webView.frame       = CGRect(x: 0, y: 0, width: MGScreenWidth, height: MGScreenHeight - 114)
// 
//        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
//        webView.navigationDelegate  = self
       self.view.backgroundColor = UIColor.darkGray
        
        WOWDelay.start(delay: 1) { 
            
        }
        
        let item = UIBarButtonItem(image:UIImage(named: "nav_backArrow"), style:.plain, target: self, action:#selector(navBack))
        navigationItem.leftBarButtonItem = item
    }
    public let webView: WKWebView = {
        let webConfiguration    = WKWebViewConfiguration()
        let w = WKWebView(frame: .zero, configuration: webConfiguration)
        return w
    }()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
            let vc = ThreeViewController()
            self.navigationController?.pushViewController(vc, animated: true)

            
    }
    func navBack() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
