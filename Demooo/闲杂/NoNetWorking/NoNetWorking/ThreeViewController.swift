//
//  ThreeViewController.swift
//  NoNetWorking
//
//  Created by 陈旭 on 2016/12/27.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import UIKit



class ThreeViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: WOWTableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.emptyDataSetSource   = self
        self.tableView.emptyDataSetDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//    func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
//        return UIColor.blue
//        
//    }
//  override  func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
//        return UIImage.init(named: "no_NetWork")
//    }
//  override  func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
//    
//        return NSAttributedString.init(string: "vvvvv", attributes: nil)
//    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
