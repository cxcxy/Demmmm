//
//  FirstView.swift
//  swift-protocol
//
//  Created by 陈旭 on 2017/8/11.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

extension UIView: NibLoadable {
}

class FirstView: UIView {

}
protocol NibLoadable {

}
extension NibLoadable where Self: UIView {

    static func loadFromNib() -> Self{
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.first as! Self
    }
}

//extension NibLoadable where Self : UIView {
//    //在协议里面不允许定义class 只能定义static
//    static func loadFromNib(_ nibname: String? = nil) -> Self {//Self (大写) 当前类对象
//        //self(小写) 当前对象
//        let loadName = nibname == nil ? "\(String(describing: Self.self))" : nibname!
//        
//        return Bundle.main.loadNibNamed(loadName, owner: nil, options: nil)?.first as! Self
//    }
//}


// 面向协议 和面向对象 两者的设计模式，应该互相使用 才更好 
// 场景： 所有的小模块， 都需要使用统一的风格， 比如cell 无点击高亮， cell 里面 有 模块ID ，这就需要  各个模块的 cell 统一继承 BaseCell， 在BaseCell 遵守 模块ID 的 协议，  ，然后当每一个模块的cell 还需要有其他的继承或延展的时候， 就再单独建一个协议，就可以了
// 如果一味的使用面试对象的 继承关系， 就会产生不能多继承的弊端 ， 如果一味的使用面向协议的编程， 就会产生一些 冗余的代码，
protocol Text {
    var name:String {get }
    
}

class People: NSObject,Text {

    
    var name: String = "haha"

    
    
}
protocol TextTwo {
    var age:String {get set}
    
}
class User: People,TextTwo {
    var age:String = ""
}
struct TextThree {
    var age:String
    
}

//struct TextFour:TextThree {
//    var name:String
//}
