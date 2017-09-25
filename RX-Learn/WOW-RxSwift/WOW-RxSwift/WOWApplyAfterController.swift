//
//  WOWApplyAfterController.swift
//  WOW-RxSwift
//
//  Created by 陈旭 on 2017/5/24.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
struct RefundReason {
    var title       : String
    var describe    : String
    var icon        : String
}
enum GoodsSendType {
    case noSendGoods    // 待发货
    case sendGoods      // 以发货
}
public func MGRgb(_ r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat = 1) -> UIColor{
    return UIColor(red:r/255.0, green: g/255.0, blue: b/255.0, alpha:alpha)
}
class WOWApplyAfterController: UIViewController,UITableViewDelegate {
    let tableView: UITableView = UITableView(frame: UIScreen.main.bounds, style: .plain)

    let disposeBag = DisposeBag()
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String,RefundReason>>()
    var storedArray = Variable<[Int]>([])
//    var reasonArray = [RefundReason]()
    var reasonArray = Variable<[RefundReason]>([])
    let reason  = RefundReason(title:"退货退款", describe:"已收到货，需要退还已收到的货物", icon:"")
    let reason1 = RefundReason(title:"仅退款", describe:"未收到货，协商退款", icon:"")
    let reason2 = RefundReason(title:"换货", describe:"对已收到的货物不满意，协商换货", icon:"")
    let reason3 = RefundReason(title:"整单退款", describe:"还未发货，协商整单取消", icon:"")
    
    fileprivate var sectionsData = [SectionModel<String, RefundReason>]()
    
    var sendType                : GoodsSendType = .noSendGoods{
        didSet{
            switch sendType {
            case .sendGoods:
                reasonArray.value = [reason,reason1,reason2]
//                reasonArray = [reason,reason1,reason2]
                break
            default:
                reasonArray.value = [reason3,reason1]
//                reasonArray = [reason3,reason1]
                break
            }
            
        }
    }
    deinit {
        print("shifang")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.separatorStyle    = .none
        tableView.delegate = self
  
        self.tableView.rowHeight            = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight   = 60
        tableView.register(UINib.init(nibName: "WOWApplyAfterCell", bundle: Bundle.main), forCellReuseIdentifier: "WOWApplyAfterCell")
        
        dataSource.configureCell = {
            (_, tableView, indexPath, reason) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "WOWApplyAfterCell", for: indexPath) as! WOWApplyAfterCell
            
            cell.lbTitle.text       = reason.title
            cell.lbDescribe.text    = reason.describe
            cell.imgAicon.image     = UIImage.init(named: reason.icon)
            cell.selectionStyle     = .none

            return cell
        }

        
 

        aaa()
        
//        reasonArray.asObservable().bind(to: tableView.rx.items(cellIdentifier: "WOWApplyAfterCell", cellType: WOWApplyAfterCell.self)) {(row,rea,cell) in
//            cell.lbTitle.text       = rea.title
//            cell.lbDescribe.text    = rea.describe
//            cell.imgAicon.image     = UIImage.init(named: rea.icon)
//            }.addDisposableTo(disposeBag)
//
        
        
      tableView.rx.itemSelected.subscribe{[weak self] (index) in
        if let strongSelf = self {
        
            strongSelf.reasonArray.value.append(strongSelf.reason)
            strongSelf.aaa()
//            strongSelf.storedArray.value.append(11)
        }
        }.addDisposableTo(disposeBag)
        
    
        
        reasonArray.asObservable().subscribe { (reason) in
            print(reason)
            self.tableView.reloadData()
        }.addDisposableTo(disposeBag)
        
        
//        storedArray.asObservable().subscribe { (a) in
//            print(a)
//
//        }.addDisposableTo(disposeBag)
//        storedArray.asObservable().subscribe(onNext: { (a) in
//             print(a)
//        }, onError: { (e) in
//            
//        }, onCompleted: { 
//            
//        }) { 
//            
//        }.addDisposableTo(disposeBag)
    }
    func aaa(){
        tableView.dataSource = nil
        for item in reasonArray.value.enumerated() {
            sectionsData.append(SectionModel(model: "", items: [item.element]))
            
        }
        let items = Observable.just(sectionsData)
        
        items.bind(to: tableView.rx.items(dataSource: dataSource)).addDisposableTo(disposeBag)
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        reasonArray.append(reason)
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
