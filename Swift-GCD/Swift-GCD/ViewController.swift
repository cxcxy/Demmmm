//
//  ViewController.swift
//  Swift-GCD
//
//  Created by 陈旭 on 2017/9/25.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
struct Point {
    let x: Int, y: Int
}
extension ViewController {
    // 线程等待
    func gcg_barrier()  {
        let concurrentQueue = DispatchQueue(label: "com.leo.concurrent", attributes: .concurrent)
        concurrentQueue.async {
            print("线程1")
        }
        
        concurrentQueue.async {
            print("线程2")
        }
        concurrentQueue.async(flags: .barrier, execute: {
            //            NSLog("Task from barrier 1 begin")
            //            sleep(3)
            //            NSLog("Task from barrier 1 end")
            print("sleep")
        })
        
        concurrentQueue.async {
            print("线程3")
        }
    }
    func gcd_serial()  {
        let serialQueue = DispatchQueue(label: "serial")
        serialQueue.async {
            
        }
//        Point(x: 1, y: 2)
//        DispatchQueue.init(label: "ser")
        
    }
    
}
