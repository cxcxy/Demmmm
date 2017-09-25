//
//  ViewController.swift
//  Xib
//
//  Created by 陈旭 on 2017/8/7.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight            = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight   = 60
        tableView.register(UINib.init(nibName: "Text_View_Cell", bundle: Bundle.main), forCellReuseIdentifier: "Text_View_Cell")
        tableView.register(UINib.init(nibName: "Text_Two_Cell", bundle: Bundle.main), forCellReuseIdentifier: "Text_Two_Cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                = tableView.dequeueReusableCell(withIdentifier: "Text_View_Cell", for: indexPath) as! Text_View_Cell
        
        return cell
        
        
    }

}
