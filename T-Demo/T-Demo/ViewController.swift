//
//  ViewController.swift
//  T-Demo
//
//  Created by 陈旭 on 2017/7/19.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
class ActionManager:NSObject{
    var actionDict:Dictionary<NSValue,()->()> = Dictionary()
    static let sharedManager = ActionManager()
    override fileprivate init(){}
}
extension UIView {
    
    //MARK:ACTION
    func addAction(_ closure:@escaping ()->()){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.tapClick(_:)))
        self.addGestureRecognizer(tap)
        ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: self)] = closure
    }
    
    func tapClick(_ tap:UITapGestureRecognizer){
        if let closure = ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: tap.view)]{
            closure()
        }else{
            
        }
    }
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var one = "haha"
//        var two = "hehe"
//        self.swapTwoValue(a: &one, b: &two)
//        print(one,two)
//        let output:String? = test(a: "124")
//        let output:Int? = test(a: "123")
        
//        NSValue.init(nonretainedObject: <#T##Any?#>)
        self.view.addAction {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func test<Type>(a: Type)->Type?{
        return a
    }
    
 
    func swapTwoIntValue( a:inout Int, b:inout Int){
        //使用inout关键字可以修改传入的数值的原始值。
        let tempValue = a
        a = b
        b = tempValue
    }
    
// T 并没有制定特定的类型
    func swapTwoValue <T> (a: inout T ,b: inout T) {
        let tempValue = a
        a = b
        b = tempValue
    }
}

