




import UIKit
import Foundation
import SwiftyJSON
import ObjectMapper
struct MySnail {
    
    // 字典或者数组 转 JSON
    static func dataTypeTurnJson(element:AnyObject) -> String {
        
        let jsonData = try! JSONSerialization.data(withJSONObject: element, options: JSONSerialization.WritingOptions.prettyPrinted)
        let str = String(data: jsonData, encoding: String.Encoding.utf8)!
//        //路径
//        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let filePath = path.stringByAppendingString("/data666.json")
//        try! str.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
//        print(filePath) //取件地址 点击桌面->前往->输入地址跳转取件
        
        return str
    }
}
// 记录用户评论的操作
class UserManage : NSObject, Mappable{
    required /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    init?(map: Map) {
        
    }

    func mapping(map: Map) {
        
    }

    
    var index         : Int?
    var key           : String = ""
    var label         : String = ""
    var value         : String = ""
    var hidden        : Bool = false

    init(index: Int, key: String, label: String, value: String,isHidden:Bool = false) {
        self.index = index
        self.key = key
        self.label = label
        self.value = value
        self.hidden = isHidden
    }

}

//import PhotoTweaks
class ViewController: UIViewController,QYConversationManagerDelegate {
    let userOne = UserManage.init(index: 0, key: "account", label: "商品", value: "家aaaaaa具")
    let userTwo = UserManage.init(index: 1, key: "cccc", label: "这是啥", value: "12阿斯顿法师打发的事3")
    let userThree = UserManage.init(index: 2, key: "account", label: "价格", value: "123")
    let userFour = UserManage.init(index: 3, key: "account", label: "价格", value: "123")

    var userArr = [UserManage]()
    @IBOutlet weak var badgeBtn: MIBadgeButton!
    @IBOutlet weak var messageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userArr =  [userOne,userTwo,userThree,userFour]
        
     
    
//     WOWCustormMessageView.sharedInstance.frame =  CGRect.init(x: 0, y: 0, width: 8, height: 8)
        
//      self.view.addSubview(WOWCustormMessageView.sharedInstance)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        messageView.addSubview(WOWCustormMessageView.sharedInstance)
    }
    @IBAction func clickAction(_ sender: Any) {

     
        print(userArr.toJSONString() ?? "")
        let userInfo = QYUserInfo()
        userInfo.userId = "3008"
        userInfo.data = userArr.toJSONString() ?? ""
        

        
        let vc = WOWSesstionViewController.sharedInstance
        
        
        QYSDK.shared().setUserInfo(userInfo)
        let source = QYSource()
        source.title =  "ccc"
        source.urlString = "https://www.baidu.com"
        source.customInfo = "hahhahahahahah"

        vc.sessionTitle = "qqqq"
        vc.source = source
        vc.hidesBottomBarWhenPushed = true
        QYCustomUIConfig.sharedInstance().autoShowKeyboard      =  false
        QYCustomActionConfig.sharedInstance().linkClickBlock = {(str) in
            print(str ?? "")
            let a = GoodsDetailsVC()
            
            vc.navigationController?.pushViewController(a, animated: true)

        }
            QYSDK.shared().customUIConfig().serviceHeadImage = UIImage.init(named: "defaultHead")
            QYSDK.shared().customUIConfig().customerMessageBubbleNormalImage = UIImage.init(named: "normal-custorm")?.resizableImage(withCapInsets: UIEdgeInsetsMake(15, 15, 30, 30), resizingMode: .tile)
        
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

