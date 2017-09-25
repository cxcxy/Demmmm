//
//  ViewController.swift
//  swift-protocol
//
//  Created by 陈旭 on 2017/8/11.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
extension DispatchQueue {
    private static var onceTracker = [String]()
    
    open class func once(token: String, block:() -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if onceTracker.contains(token) {
            return
        }
        
        onceTracker.append(token)
        block()
    }
}


extension UIViewController {
    open override static func initialize() {
        struct Static {
            static var token = NSUUID().uuidString
        }
        
        if self != UIViewController.self {
            return
        }
        
        DispatchQueue.once(token: Static.token) {
            let originalSelector = #selector(UIViewController.viewDidAppear(_:))
            let swizzledSelector = #selector(UIViewController.xl_viewWillAppear(animated:))
            
            let originalMethod = class_getInstanceMethod(self, originalSelector)
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
            
            
            //在进行 Swizzling 的时候,需要用 class_addMethod 先进行判断一下原有类中是否有要替换方法的实现
            let didAddMethod: Bool = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
            //如果 class_addMethod 返回 yes,说明当前类中没有要替换方法的实现,所以需要在父类中查找,这时候就用到 method_getImplemetation 去获取 class_getInstanceMethod 里面的方法实现,然后再进行 class_replaceMethod 来实现 Swizzing
            
//            if didAddMethod {
                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
//            } else {
//                method_exchangeImplementations(originalMethod, swizzledMethod)
//            }
        }
    }
    
    func xl_viewWillAppear(animated: Bool) {
        self.xl_viewWillAppear(animated: animated)
        print("xl_viewWillAppear in swizzleMethod")
        self.view.backgroundColor = UIColor.orange
    }
    

    func newViewWillAppear(_ animated: Bool)  {
        self.newViewWillAppear(animated)
        print("self.newViewWillAppear(animated)")
    }
}


class ViewController: UIViewController {
    var aBool:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()

        let view = FirstView.loadFromNib()
        self.view.addSubview(view)
       
        
        let u = User()
        u.name = "嘿嘿"
        print(u.name)
        
        
        
        let u1 = User()
        u1.name = "gggg"
        print(u1.name)
        
        print(object_getClass(TestASwift.self))
//        method_getTypeEncoding(<#T##m: Method!##Method!#>)
        
//        let originalSelector = class_getInstanceMethod(object_getClass(self), #selector(viewWillAppear(_:)))
        
//        let swizzledSelector = class_getInstanceMethod(object_getClass(self), #selector(newViewWillAppear(_:)))
        

//        let originalSeletor = Selector("viewWillAppear:")
//        let swizzledMethod = Selector("newViewWillAppear:")
        
//         let didAddMethod = class_addMethod(object_getClass(self), Method.init(bitPattern:) originalSelector, method_getImplementation(swizzledSelector), method_getTypeEncoding(swizzledSelector))
        
//        if didAddMethod {
//            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
//            class_replaceMethod(object_getClass(self), swizzledMethod,  method_getImplementation(originalSeletor), method_getTypeEncoding(originalSeletor))
            
            
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//        method_exchangeImplementations(swizzledSelector, originalSelector)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func testGetMethodListAndProperyList()  {
        let aSwiftClass:TestASwift = TestASwift()
        self.showCls(cls: object_getClass(aSwiftClass))
        self.showCls(cls: object_getClass(self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear(animated)")
        self.view.backgroundColor = UIColor.red
    }

    
    func showCls(cls:AnyClass)  {
        print("start methodList")
        var methodNum:UInt32 = 0
        let methodList = class_copyMethodList(cls, &methodNum)
        for index in 0..<numericCast(methodNum) {
            let method: Method = methodList![index]!
            print(String(describing: method_getTypeEncoding(method)))
            print(String(describing: method_copyReturnType(method)))
            print(String(describing: method_getName(method)))
        }
        print("end methodList")
        
        print("start properyList")
        var properyNum:UInt32 = 0
        let properyList = class_copyMethodList(cls, &properyNum)
        for index in 0..<numericCast(properyNum) {
            let method: Method = properyList![index]!
            print(String(describing: property_getName(method)))
//            print(String(describing: method_copyReturnType(method)))
//            print(String(describing: method_getName(method)))
        }
        print("end properyList")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class TestSwizzling : NSObject {
    dynamic func methodOne()->Int{
        return 1
    }
}

extension TestSwizzling {
    
    //In Objective-C you'd perform the swizzling in load(),
    //but this method is not permitted in Swift
    override class func initialize()
    {
        
        struct Inner {
            static let i = {
                
                let originalSelector = #selector(TestSwizzling.methodOne)
                let swizzledSelector = #selector(TestSwizzling.methodTwo)
                let originalMethod = class_getInstanceMethod(TestSwizzling.self, originalSelector);
                let swizzledMethod = class_getInstanceMethod(TestSwizzling.self, swizzledSelector)
                method_exchangeImplementations(originalMethod, swizzledMethod)
            }
        }
        let _ = Inner.i
    }
    
    func methodTwo()->Int{
        // It will not be a recursive call anymore after the swizzling
        return methodTwo()+1
    }
}
//
//var c = TestSwizzling()
//print(c.methodOne())
//print(c.methodTwo())




class TestASwift  {
    var aBool: Bool = true
    func testReturnVoid()  {
        
    }
}


private var UIControl_ignoreEvent = "UIControl_ignoreEvent"

extension UIControl {

    var cx_acceptEventInterval:TimeInterval {
    
        get{
            let acceptEventInterval = objc_getAssociatedObject(self, #function) as? TimeInterval
            return acceptEventInterval ?? 0
        }
        
        set{
            objc_setAssociatedObject(self, #function, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }


}




