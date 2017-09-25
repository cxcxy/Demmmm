//
//  ViewController.swift
//  T-iOS11
//
//  Created by 陈旭 on 2017/9/19.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
public let MGScreenWidth:CGFloat = UIScreen.main.bounds.size.width
public let MGScreenHeight:CGFloat = UIScreen.main.bounds.size.height
class ViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.view.addSubview(tableView)
        tableView.register(UINib.init(nibName: "TestTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TestTableViewCell")
//        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        
//
//        var url = "22"
//        url.withCString(encodedAs: <#T##_UnicodeEncoding.Protocol#>, <#T##body: (UnsafePointer<FixedWidthInteger & UnsignedInteger>) throws -> Result##(UnsafePointer<FixedWidthInteger & UnsignedInteger>) throws -> Result#>)
//        let encodedHost = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
//
//        tableView.estimatedRowHeight = 200
//          print("线程")
//        testFor()
        
        gcg_barrier()
    }
    func testFor()  {
//        for a in 0..<100 {
//
//            autoreleasepool {
//
//            }
//        }
//        GCD实现线程同步的方法：
//        组队列（dispatch_group）：
//        let globalQueue = DispatchQueue.init(label: "data", qos: .default, attributes: .concurrent, autoreleaseFrequency: .workItem, target: <#T##DispatchQueue?#>)
//        let globalQueue = DispatchQueue(label: "data", attributes: .concurrent)
        let globalQueue = DispatchQueue.global()
        let group = DispatchGroup() // 创建一个分组
        
        
//        let wirte = DispatchWorkItem(flags: .barrier) {
//            // write data
//        }


        
        
        
//        globalQueue.async {
//            print("线程1")
//
//        }
//        globalQueue.async {
//            print("线程2")
//        }
//        globalQueue.async {
//            print("线程3")
//        }
//
//        globalQueue.async {
//            print("线程4")
//        }
//        globalQueue.async {
//            print("线程5")
//        }
//        for i in 0..<5 {

        
//        let wite = DispatchWorkItemFlags.barrier
        let write = DispatchWorkItem(flags: .barrier) {
              print("休息")
            globalQueue.async(group: group, execute: {
                
                print("线程1")
            })
            //       }
            globalQueue.async(group: group, execute: {
                
                print("线程2")
            })
        }
        

//        globalQueue.async(execute: write)
//        globalQueue.asyncAfter(deadline: .b, execute: <#T##() -> Void#>)
        
        
        let dataQueue = DispatchQueue(label: "data", attributes: .concurrent)
        dataQueue.async(execute: write)
        
        dataQueue.async{
            
            print("线程3")
        }
        dataQueue.async{
            
            print("线程4")
        }
      
        group.notify(queue: globalQueue) {
            print("完成")
        }
        
    }
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var tableView:UITableView = {
        let v = UITableView(frame: CGRect.init(x: 0, y: 0, width: MGScreenWidth, height: MGScreenHeight), style:.grouped)
        v.delegate        = self
        v.dataSource      = self
        v.separatorStyle  = .none
        return v
    }()

}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        
        return cell
        
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 44
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TestView.loadFromNib()
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }

    
}
