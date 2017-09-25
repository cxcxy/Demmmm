//
//  ViewController.swift
//  TimeLinessDemo
//
//  Created by 陈旭 on 2017/5/9.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
struct WOWDelay {
    // delay -- 多少秒后结束 回掉
    func start(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
}
let colorDefult = UIColor.red
let colorDone   = UIColor.darkGray
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let data : [(TimelinePoint, UIColor, UIColor)]
        = [(TimelinePoint(color: colorDefult, filled: true),UIColor.clear,colorDefult),
                                                      (TimelinePoint(color: colorDefult, filled: true),colorDefult,colorDone),
                                                      (TimelinePoint(color: colorDone, filled: true),colorDone,UIColor.clear)]
    @IBOutlet weak var tableView: UITableView!
    
    let RefundArray:[[Any]] = [[1,"尺码拍错／不喜欢／不想要"]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib.init(nibName: "WOWTimerLineCell", bundle: Bundle.main), forCellReuseIdentifier: "WOWTimerLineCell")
          tableView.register(UINib.init(nibName: "WOWMoneyTopCell", bundle: Bundle.main), forCellReuseIdentifier: "WOWMoneyTopCell")
        self.tableView.rowHeight          = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        let a = RefundArray[0]
        print(a[1])
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row != 0 else {
            let cell                = tableView.dequeueReusableCell(withIdentifier: "WOWMoneyTopCell", for: indexPath) as! WOWMoneyTopCell

            return cell
        }
        
        let cell                = tableView.dequeueReusableCell(withIdentifier: "WOWTimerLineCell", for: indexPath) as! WOWTimerLineCell
        let (timelinePoint, timeLineTopColor, timeLineBottomColor) = data[indexPath.row - 1]
        cell.timelinePoint          = timelinePoint
        cell.timeline.frontColor    = timeLineTopColor
        cell.timeline.backColor     = timeLineBottomColor
        return cell
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

