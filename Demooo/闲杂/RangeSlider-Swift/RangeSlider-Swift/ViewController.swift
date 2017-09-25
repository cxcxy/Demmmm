//
//  ViewController.swift
//  RangeSlider-Swift
//
//  Created by 陈旭 on 2017/2/17.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
import SnapKit
public enum Defaule_Size : Float{
//
    case ThreeToTwo = 0.67
    case ThreeToOne = 0.33
    case OneToOne   = 1
}
extension String {
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }
}

struct IMGSIZE {
    
    static let a = 1/3
    
    // 后台返回的图片后面有图片size的参数 此方法拿到。 默认 1比1
    static func get_img_sizeNew(str:String,width:CGFloat,defaule_size:Defaule_Size) -> CGFloat {
        
        let array = str.components(separatedBy: "_2dimension_")
        var rate        = defaule_size.rawValue
        switch defaule_size {
        case .OneToOne:
            rate = Float(self.a)
            
        case .ThreeToOne:
            rate = Float(self.a)
        case .ThreeToTwo:
            rate = Float(self.a)
            
        default:break
            
        }

      
        if array.count > 1 {
           let c = array[1].components(separatedBy: ".")
            if c.count > 1 {
                let d = c[0].components(separatedBy: "x")
                if d.count > 1 {
                  
                    if let height = d[1].toFloat(),let width = d[0].toFloat() {
                        rate = height / width
                    }

                }
            }
            
        }
        return CGFloat(rate) * width
    }
    

}
public extension UINib{
    
    class func nibName(_ name:String) ->UINib{
        return UINib(nibName: name, bundle: Bundle.main)
    }
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,Cell_Class_BannerDelegate {

//    @IBOutlet weak var tableView: UITableView!
    var tableView: UITableView!
//    let rangeSlider = RangeSlider(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // custom string format example
        self.view.backgroundColor = UIColor.red
        
        
//        let str = "https://img.wowdsgn.com/page/banners/d74d583b-09c7-4217-bafb-adfe1ef81bab_2dimension_750750.jpg"
//        
//        let a =   IMGSIZE.get_img_sizeNew(str: str, width: 345, defaule_size: .ThreeToOne)
//        print(a)
//        let b = IndexPath.init(row: 0, section: 3)
//        tableView.scrollToRow(at: b, at: .top, animated: true)
//        tableView.register(UINib.nibName("SVCloosePriceCell"), forCellReuseIdentifier:"SVCloosePriceCell")
//        tableView.register(CloosePriceCell.self, forCellReuseIdentifier: "CloosePriceCell")
//        
//        tableView.register(UINib.nibName("Cell_Class_Banner"), forCellReuseIdentifier: "Cell_Class_Banner")
//        self.tableView.rowHeight          = UITableViewAutomaticDimension
//        self.tableView.estimatedRowHeight = 410
        let containerView = UIStackView.init()
        containerView.axis = UILayoutConstraintAxis.vertical
        containerView.alignment = UIStackViewAlignment.fill
        containerView.distribution = UIStackViewDistribution.fill
        containerView.spacing = 10
        
        tableView =  UITableView.init(frame: CGRect.init(x: 0, y: 0, width: MGScreenWidth, height: MGScreenHeight), style: .grouped)
        //        tableView.style = .grouped
        //        tableView.backgroundColor   = GrayColorLevel5
                tableView.delegate          = self
                tableView.dataSource        = self
        tableView.separatorStyle    = .none
        self.tableView.rowHeight            = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight   = 60
        self.tableView.backgroundColor = UIColor.red
        
        let bottomView = UIView.init()
        //        bottomView.frame.size = CGSize.init(width: MGScreenWidth, height: 50)
        bottomView.backgroundColor = UIColor.black
        containerView.addArrangedSubview(tableView)
        containerView.addArrangedSubview(bottomView)
        self.view.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        bottomView.snp.makeConstraints { (make) in
            make.height.equalTo(50)
        }
        bottomView.isHidden = true
//        tableView.isHidden = true
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell                = tableView.dequeueReusableCell(withIdentifier: "Cell_Class_Banner", for: indexPath) as! Cell_Class_Banner

//        cell.delegate = self
        return cell
        
        
    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 10
//    }
    
    func updataTableViewCellHight(){
        
//        tableView.reloadData()
//        let a = NSIndexPath.init
//        tableView.cellForRow(at: <#T##IndexPath#>)
        
//        tableView.beginUpdates()
//        let indexSet = NSIndexSet.init(index: 0)
//        tableView.reloadSections(indexSet as IndexSet, with: .none)
//        tableView.reloadData()
//        tableView.endUpdates()
        
        
        
//        tableView.layoutIfNeeded()
//        tableView.updateConstraints()
//        tableView.updateConstraintsIfNeeded()
//        tableView.setNeedsLayout()
//        tableView.layoutIfNeeded()
//        tableView.layoutSubviews()
//        tableView.setNeedsUpdateConstraints()
//        tableView.updateConstraints()
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

