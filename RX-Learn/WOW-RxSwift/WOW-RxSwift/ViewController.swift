//
//  ViewController.swift
//  WOW-RxSwift
//
//  Created by 陈旭 on 2017/5/23.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

import Then
import RxSwift
import RxDataSources
import SwiftyUserDefaults
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var tab  = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        
//        $0.register(MyCell.self, forCellReuseIdentifier: "myCell")
    }
    
    let label = UILabel().then { (l) in
//         l.backgroundColor = .clear
//         l.backgroundColor = .red
    }
    
//    let tableView: UITableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
    let reuseIdentifier = "\(TableViewCell.self)"
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>()
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    var heightSet = [CGFloat]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        dataSource.configureCell = {
            (_, tableView, indexPath, user) in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as! TableViewCell
            cell.tag = indexPath.row
            cell.user = user
            return cell
        }
//        Observable.ju
//        Observable<[SectionModel<String, User>]>
//            .bind(to: tableView.rx.items(dataSource: dataSource))
//            .addDisposableTo(disposeBag)
//        self.news.removeAll()
        var users = [User]()
        for _ in 0..<9 {
            let use = User(followersCount: 1, followingCount: 2, screenName: "2016-07-01")
            users.append(use)
        }
        heightSet.removeAll()
        let sections = [
            SectionModel(model: "", items: users)
        ]
        let items = Observable.of(sections).take(3)

        items.bind(to: tableView.rx.items(dataSource: dataSource)).addDisposableTo(disposeBag)
        
//        tableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
//            print("1")
//        }, onError: { (error) in
//            print("2")
//        }, onCompleted: { 
//            print("3")
//        }) { 
//            print("4")
//        }.addDisposableTo(disposeBag)
        tableView.rx.itemSelected.subscribe { (indexpath) in
            print(indexpath.element?.row ?? 0)
            print(indexpath.element?.section ?? 1)
            let vc = WOWApplyAfterController()
            vc.sendType = .sendGoods
            self.navigationController?.pushViewController(vc, animated: true)
        }.addDisposableTo(disposeBag)
        
    
        
//        tableView.rx.modelSelected(int)
        
//        viewModel.getUsers()
//            .bind(to: tableView.rx.items(dataSource: dataSource))
//            .addDisposableTo(disposeBag)

        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         let vc = WOWApplyAfterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

