//
//  ViewController.swift
//  MaskDemo
//
//  Created by 陈旭 on 2017/5/5.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
extension UILabel {
    func setStrokeWithText( _ str:String ){
        
        let attrString      = NSAttributedString(string: str, attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
        self.attributedText = attrString
        
    }
//    extension UILabel {
        func afterDetailFormat(defaultText:String,describeText:String){
            self.strokeWithText(defaultText , str2: describeText , str2Font: 14, str2Color: UIColor.red)
        }
//    }
    // 指定的字体改变颜色字体
    func strokeWithText( _ str1:String,str2:String,str2Font:CGFloat,str2Color:UIColor){
        
        let  mustr1 = NSMutableAttributedString.init(string: str1 + str2)
        
        let strLeng = str1.characters.count
        let str1Leng = str2.characters.count
        
        let str1Range = NSMakeRange(strLeng, str1Leng)
        // 颜色
        mustr1 .addAttribute(NSForegroundColorAttributeName, value: str2Color, range: str1Range)
        // 线条
        //        mustr1 .addAttribute(NSStrikethroughStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: str1Range)
        // 字体
        mustr1 .addAttribute(NSFontAttributeName, value:UIFont.systemFont(ofSize: str2Font), range: str1Range)
        
        let strPlace = NSAttributedString.init(string: "  ")
        mustr1 .insert(strPlace, at: strLeng)
        
        self.attributedText = mustr1
    }
}

extension String {
      /// EZSE: Converts String to Double
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    /// EZSE: Converts String to Float
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }
}

//public let MGScreenWidth:CGFloat = UIScreen.main.bounds.size.width
//public let MGScreenHeight:CGFloat = UIScreen.main.bounds.size.height
class ViewController: UIViewController,UITextFieldDelegate {
    
    var tableView: UITableView!

    @IBOutlet weak var tvTest: UITextField!
    @IBOutlet weak var lbTextPrice: UILabel!
    var params_maxMoney             : String    = "2."
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.addSubview(commitBtn)
        
    }
//
    lazy var commitBtn: UIButton = {
        
        let btn = UIButton(frame:CGRect.init(x: 0, y: 100, width: MGScreenWidth, height: 50))
        btn.addTarget(self, action: #selector(commitClickAction), for: .touchUpInside)
        btn.backgroundColor = UIColor.red
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitle("提交", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return btn
        
    }()
    func commitClickAction()  {
//           print(self.params_maxMoney)
//        let vc = TwoViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let vc = WOWBasePickerViewController()
        
        vc.showPicker(arr: ["a","b","c","d"], index: 2)
        vc.selectBlock = {(str,index) in
            print(str,index)
        }
        self.presentToMaskViewController(viewControllerToPresent: vc)
    }

    
    lazy var testView:TestView = {[unowned self] in
        
        let v = Bundle.main.loadNibNamed(String(describing: TestView.self), owner: self, options: nil)?.last as! TestView
        v.frame = CGRect.init(x: 0, y: MGScreenHeight - 300, width: MGScreenWidth, height: 300)
        return v
        
        }()
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

