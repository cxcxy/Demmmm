////
////  Delay.swift
////  PhotoTweaks-Demo
////
////  Created by 陈旭 on 2017/4/20.
////  Copyright © 2017年 陈旭. All rights reserved.
////
//
//import UIKit
//
//import Foundation
//
//typealias Task = (_ cancel : Bool) -> Void
//
//func delay(time:TimeInterval, task:()->()) ->  Task? {
//    
//    
//    
//    func dispatch_later(block:()->()) {
//    
//        
//   
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + time * Double(nses_p)) {
//        
//        }
//        
//        dispatch_after(
//            DispatchTime.now(
//                dispatch_time_t(DispatchTime.now()),
//                Int64(time * Double(NSEC_PER_SEC))),
//            dispatch_get_main_queue(),
//            block)
//    }
//    
//    var closure: dispatch_block_t? = task
//    var result: Task?
//    
//    let delayedClosure: Task = {
//        cancel in
//        if let internalClosure = closure {
//            if (cancel == false) {
//                dispatch_async(dispatch_get_main_queue(), internalClosure);
//            }
//        }
//        closure = nil
//        result = nil
//    }
//    
//    result = delayedClosure
//    
//    dispatch_later {
//        if let delayedClosure = result {
//            delayedClosure(cancel: false)
//        }
//    }
//    
//    return result;
//}
//
//func cancel(task:Task?) {
//    task?(cancel: true)
//}
