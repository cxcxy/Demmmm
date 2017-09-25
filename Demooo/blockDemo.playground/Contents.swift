//: Playground - noun: a place where people can play

import UIKit
/// 作为变量使用
//var double:(Int) -> Int
//double = { num in
//    return num * 2
//    
//}
//print(double(2))
// /// 作为可选性
//var optionalDouble : ((Int)->Int)?
////optionalDouble?(2)
//optionalDouble = {num in return num * 2}
//optionalDouble?(2)
var array = [1,2,3,4,2]
array.sort({(item1:Int,item2:Int)->Bool in return item1 < item2})
//array.sort{(itme1，item2) in return itme1 < item2 }
array.sort{$0 < $1}