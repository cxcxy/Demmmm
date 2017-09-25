//
//  ViewController.swift
//  ChangeImage
//
//  Created by 陈旭 on 2017/8/30.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

struct Name {
   static let name:String = "哈哈"
    
}
protocol SwitchWithTextCellProtocol {
    var title: String { get }
    var titleFont: UIFont { get }
    var titleColor: UIColor { get }
    
    var switchOn: Bool { get }
    var switchColor: UIColor { get }
    
    func onSwitchToggleOn(on: Bool)
}

extension UIImage
{

    class func multiply(image:UIImage, color:UIColor) -> UIImage? {
        let rect = CGRect(origin: .zero, size: image.size)
        
        //image colored
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let coloredImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //image multiply
        UIGraphicsBeginImageContextWithOptions(image.size, true, 0)
        let context = UIGraphicsGetCurrentContext()
        
        // fill the background with white so that translucent colors get lighter
        context!.setFillColor(UIColor.white.cgColor)
        context!.fill(rect)
        
        image.draw(in: rect, blendMode: .normal, alpha: 1)
        coloredImage?.draw(in: rect, blendMode: .multiply, alpha: 1)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
    
}

extension Array {
    func takeElements(elementCount: Int) -> Array {
        if (elementCount > count) {
            return Array(self[0..<count])
        }
        return Array(self[0..<elementCount])
    }
    func takeFormElements(elementCount: Int) -> Array {
        if (count > elementCount) {
            return Array(self[0..<elementCount])
        }
        return self
    }
}
import UITableView_FDTemplateLayoutCell
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgOne: UIImageView!
    @IBOutlet weak var imgTwo: UIImageView!
    
    @IBOutlet weak var imgThree: UIImageView!
    
//    var dicHeight : Dictionary = [:]
    
    var dicHeight = Dictionary<IndexPath, CGFloat>() //空字典
    var strArr: [String] = []

    var f5Color = UIColor.init(red: 245.00/255.00, green: 245.00/255.00, blue: 245.00/255.00, alpha: 1.0)
    
    var lastContentOffset :CGFloat = 0.0

    func configure(_ delegate: SwitchWithTextCellProtocol)  {
//        delegate.title
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.clear), for: UIBarMetrics.default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        print("ViewController  viewWillAppear")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController  viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController  viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController  viewDidDisappear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        Name.name
        self.tableView.fd_debugLogEnabled = true
        tableView.register(UINib.init(nibName: "Text_View_Cell", bundle: Bundle.main), forCellReuseIdentifier: "Text_View_Cell")
         tableView.register(UINib.init(nibName: "Two_View_Cell", bundle: Bundle.main), forCellReuseIdentifier: "Two_View_Cell")
//        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        tableView.estimatedRowHeight = 100
        tableView.rowHeight          = UITableViewAutomaticDimension
        self.view.layoutIfNeeded()
        
//        let str = Mirror.init(reflecting: Two_View_Cell.self)
//        print(str.subjectType)
//        let s = objc_getClass(Two_View_Cell.self)
//        print(s)
//        if let path = Bundle.main.path(forResource: "Two_View_Cel", ofType: "nib") {
//            print(path)
//        }else {
//            print("不存在")
//        }
//
        print("ViewController  viewDidLoad")
        
        
        strArr = ["https://img.wowdsgn.com/product/693e9af84d3dfcc71e640e005bdc5e2e/o_1b0euqa1lm2a1v9jet7lvumvu35.jpg",
                  "https://img.wowdsgn.com/product/693e9af84d3dfcc71e640e005bdc5e2e/o_1b0euqedq9b61mlj1l2810921aj03a.jpg",
                    "https://img.wowdsgn.com/product/693e9af84d3dfcc71e640e005bdc5e2e/o_1b0euqpbk7f71269hll1pt1ms23f.jpg",
                    "https://img.wowdsgn.com/product/693e9af84d3dfcc71e640e005bdc5e2e/o_1b0euqts51kadpl19mt113v1jeq3k.jpg",
                    "https://img.wowdsgn.com/product/693e9af84d3dfcc71e640e005bdc5e2e/o_1b0eur103iq96u5reu1pie117b3p.jpg"]
        
//        makeRightNavigationItem(rightNagationItem)

//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
//        self.navigationController?.navigationBar.setna
        
//        DSNavigationBar.setNavigationBarWithColors(UIColor.red)
//        DSNavigationBar.appearance().
          self.navigationController?.navigationBar.isTranslucent = true
         let a = self.navigationController?.navigationBar as? DSNavigationBar
        a?.setNavigationBarWith(UIColor.red)
        
        
    }
    func makeRightNavigationItem(_ navigationItem:UIView){
        
        let item = UIBarButtonItem(customView: navigationItem)
        
        let spaceItem = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spaceItem.width = -10
        self.navigationItem.rightBarButtonItem = item
        self.navigationItem.rightBarButtonItems = [spaceItem,item]
        
        if let left = self.navigationItem.rightBarButtonItem{
//            let offset = UIDevice.deviceType.rawValue > 3 ? -20 : -16
            left.imageInsets = UIEdgeInsetsMake(0,CGFloat(-20),0, 8);
        }
        
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)

        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }

    lazy var basePikerView:WOWSingMainView = {[unowned self] in
        
        let v = Bundle.main.loadNibNamed(String(describing: WOWSingMainView.self), owner: self, options: nil)?.last as! WOWSingMainView
//        v.frame = CGRect.init(x: 0, y: 0, width: MGScreenWidth, height: MGScreenHeight)
        
        return v
        
        }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var rightNagationItem:WOWRightNavigationItemOne = {
        let view = Bundle.main.loadNibNamed(String(describing: WOWRightNavigationItemOne.self), owner: self, options: nil)?.last as! WOWRightNavigationItemOne
//        view.newView.setCornerRadius(radius: 4)
//        view.buyCarButton.addTarget(self, action: #selector(toVCCart), for: .touchUpInside)
//        view.infoButton.addTarget(self, action: #selector(toVCMessageCenter), for: .touchUpInside)
//        view.backgroundColor = UIColor.red
        return view
    }()
    func toVCCart()  {
        print("111")
    }
    func toVCMessageCenter()  {
        print("222")
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        let cell = tableView.cellForRow(at: indexPath)
////        switch cell?.reuseIdentifier ?? "" {
////        case "Text_View_Cell":
//        if indexPath.section == 0 {
//        
//            return tableView.fd_heightForCell(withIdentifier: "Text_View_Cell", cacheBy: indexPath, configuration: { (cell ) in
//                self.setCellContentStr((cell as? Text_View_Cell)!, indexPath: indexPath, str: self.strArr[indexPath.row])
//            })
//        }else {
//            return tableView.fd_heightForCell(withIdentifier: "Two_View_Cell", cacheBy: indexPath, configuration: { (cell) in
//                self.setTwoContentStr((cell as? Two_View_Cell)!, indexPath: indexPath, str: self.strArr[indexPath.row])
//            })
//        }
//
//
//    }
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let h = self.dicHeight[indexPath]
        if let h = h {
            return h
        }else {
            return 200
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell                = tableView.dequeueReusableCell(withIdentifier: "Text_View_Cell", for: indexPath) as! Text_View_Cell
//            self.setCellContentStr((cell), indexPath: indexPath, str: self.strArr[indexPath.row])
//
//            if indexPath.row == 0 {
//                cell.heightConstraint.constant = 100
//            }
            
//            let h = tableView.fd_heightForCell(withIdentifier: "Text_View_Cell", cacheBy: indexPath, configuration: { (cell ) in
//                    self.setCellContentStr((cell as? Text_View_Cell)!, indexPath: indexPath, str: self.strArr[indexPath.row])
//            })
            
            
            
            
//            
//           cell.contentView.layoutIfNeeded()
//           cell.contentView.updateConstraintsIfNeeded()
//////            let h = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
//        let view_h = cell.contentView.bounds.size.height
//    
////            print(cell.contentView.bounds.size.height)
//            print(h)
//            print(view_h)
//            return cell
        
//        }else {
        
            let cell                = tableView.dequeueReusableCell(withIdentifier: "Two_View_Cell", for: indexPath) as! Two_View_Cell
//            self.setTwoContentStr((cell), indexPath: indexPath, str: self.strArr[indexPath.row])
            
//            cell.layoutIfNeeded()
//            cell.updateConstraintsIfNeeded()
//            let h = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
//               print(cell.contentView.bounds.size.height)
            
            return cell
            
//        }

        
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        basePikerView.show()
        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
         self.dicHeight[indexPath] = cell.frame.size.height
    }
    
    func setCellContentStr(_ cell:Text_View_Cell,indexPath:IndexPath,str:String)  {
        cell.lbTitle.text = str
    }
    func setTwoContentStr(_ cell:Two_View_Cell,indexPath:IndexPath,str:String)  {
        cell.lbTitle.text = str
    }
}

extension UIColor {
    /// EZSE: init method with RGB values from 0 to 255, instead of 0 to 1. With alpha(default:1)
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    /// EZSE: init method with hex string and alpha(default: 1)
    public convenience init?(hexString: String, alpha: CGFloat = 1.0) {
        var formatted = hexString.replacingOccurrences(of: "0x", with: "")
        formatted = formatted.replacingOccurrences(of: "#", with: "")
        if let hex = Int(formatted, radix: 16) {
            let red = CGFloat(CGFloat((hex & 0xFF0000) >> 16)/255.0)
            let green = CGFloat(CGFloat((hex & 0x00FF00) >> 8)/255.0)
            let blue = CGFloat(CGFloat((hex & 0x0000FF) >> 0)/255.0)
            self.init(red: red, green: green, blue: blue, alpha: alpha)        } else {
            return nil
        }
    }
    
    /// EZSE: init method from Gray value and alpha(default:1)
    public convenience init(gray: CGFloat, alpha: CGFloat = 1) {
        self.init(red: gray/255, green: gray/255, blue: gray/255, alpha: alpha)
    }
    
    /// EZSE: Red component of UIColor (get-only)
    public var redComponent: Int {
        var r: CGFloat = 0
        getRed(&r, green: nil, blue: nil, alpha: nil)
        return Int(r * 255)
    }
    
    /// EZSE: Green component of UIColor (get-only)
    public var greenComponent: Int {
        var g: CGFloat = 0
        getRed(nil, green: &g, blue: nil, alpha: nil)
        return Int(g * 255)
    }
    
    /// EZSE: blue component of UIColor (get-only)
    public var blueComponent: Int {
        var b: CGFloat = 0
        getRed(nil, green: nil, blue: &b, alpha: nil)
        return Int(b * 255)
    }
    
    /// EZSE: Alpha of UIColor (get-only)
    public var alpha: CGFloat {
        var a: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &a)
        return a
    }
    

    
}


