//
//  TestViewController.swift
//  ChangeImage
//
//  Created by 陈旭 on 2017/9/18.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
import SnapKit
class TestViewController: UIViewController {
    var lastContentOffset :CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {[weak self] (make) in
            make.top.bottom.right.left.equalTo((self?.view)!)
        }
        tableView.register(UINib.init(nibName: "Two_View_Cell", bundle: Bundle.main), forCellReuseIdentifier: "Two_View_Cell")
        
        print("TestVC  ViewDidLoad")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.clear), for: UIBarMetrics.default)

        self.navigationController?.navigationBar.shadowImage = UIImage()
          print("TestVC  viewWillAppear")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TestVC  viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         print("TestVC  viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
         print("TestVC  viewDidDisappear")
    }

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
}
lazy var tableView:UITableView = {
    let v = UITableView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), style:.grouped)
    v.delegate        = self
    v.dataSource      = self
    v.separatorStyle  = .none
    v.backgroundColor = UIColor.red
    return v
}()
    
    func makeRightNavigationItem(_ navigationItem:UIView){
        
        let item = UIBarButtonItem(customView: navigationItem)

        let spaceItem = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spaceItem.width = -10
        self.navigationItem.rightBarButtonItem = item
        self.navigationItem.rightBarButtonItems = [spaceItem,item]
//        self.navigationController?.navigationItem
        if let left = self.navigationItem.rightBarButtonItem{
            //            let offset = UIDevice.deviceType.rawValue > 3 ? -20 : -16
            left.imageInsets = UIEdgeInsetsMake(0,CGFloat(-20),0, 8);
        }
//
    }


}
extension TestViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                = tableView.dequeueReusableCell(withIdentifier: "Two_View_Cell", for: indexPath) as! Two_View_Cell
        
        return cell
        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TwoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let a = scrollView.contentOffset.y
        let f = fabs(a/90.0)
        let l = f > 1.0 ? 1:f
        

        
        let w = UIColor.init(hexString: "FFFFFF", alpha: l)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.getImageWithColor(color: w!), for: UIBarMetrics.default)

        if a -  lastContentOffset  > 20 && a > 0{
            lastContentOffset = a
            self.navigationController?.setNavigationBarHidden(true, animated: true)

        }else if lastContentOffset - a > 20 && (a  <= scrollView.contentSize.height-scrollView.bounds.size.height-20) {
            lastContentOffset = a

            self.navigationController?.setNavigationBarHidden(false, animated: true)

        }
    }
    
}
extension UIImage {
    class func getImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
//extension UIColor {
//    /// EZSE: init method with RGB values from 0 to 255, instead of 0 to 1. With alpha(default:1)
//    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
//        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
//    }
//
//    /// EZSE: init method with hex string and alpha(default: 1)
//    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
//        var formatted = hexString.replacingOccurrences(of: "0x", with: "")
//        formatted = formatted.replacingOccurrences(of: "#", with: "")
//        if let hex = Int(formatted, radix: 16) {
//            let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16)/255.0)
//            let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8)/255.0)
//            let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0)/255.0)
//            self.init(red: red, green: green, blue: blue, alpha: alpha)        } else {
//            return nil
//        }
//}
//}

