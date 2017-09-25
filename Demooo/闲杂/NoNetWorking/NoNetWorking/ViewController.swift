//
//  ViewController.swift
//  NoNetWorking
//
//  Created by 陈旭 on 2016/12/26.
//  Copyright © 2016年 陈旭. All rights reserved.
//
public extension UINib{
    
    /// 哈哈
    ///
    /// - Parameter name: 33
    /// - Returns: 22
    
    class func nibName(_ name:String) ->UINib{
        return UINib(nibName: name, bundle: Bundle.main)
        
    }
}


class WOWTableView: UITableView,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.emptyDataSetSource   = self
        self.emptyDataSetDelegate = self
//        self.tableView.rowHeight          = UITableViewAutomaticDimension
//        self.tableView.estimatedRowHeight = 410
    }
    
    
}

import UIKit
import DZNEmptyDataSet
class ViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.tableView.emptyDataSetSource   = self
//        self.tableView.emptyDataSetDelegate = self
        self.tableView.register(UINib.nibName("WOWFeedBackCell"), forCellReuseIdentifier: "WOWFeedBackCell")
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //: # df
    @IBAction func clickAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ThreeViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                = tableView.dequeueReusableCell(withIdentifier: "WOWFeedBackCell", for: indexPath) as! WOWFeedBackCell
        
        return cell
        
        
    }

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell                = tableView.dequeueReusableCell(withIdentifier: "WOWFeedBackCell", for: indexPath) as! WOWFeedBackCell
//        
//        return cell
//        
//
//    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ThreeViewController")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

