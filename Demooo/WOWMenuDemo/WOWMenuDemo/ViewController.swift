//
//  ViewController.swift
//  WOWMenuDemo
//
//  Created by 陈旭 on 2017/5/25.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit


class WOWBaseTableView: UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.separatorStyle         = .none
        self.backgroundColor        = UIColor.red
        self.rowHeight              = UITableViewAutomaticDimension
        self.estimatedRowHeight     = 60
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    let tableView: WOWBaseTableView = WOWBaseTableView(frame: UIScreen.main.bounds, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        test { (images,asstes,isupdete) in
//            
//        }

//               view.addSubview(tableView)
    }
    func test(ChoosePhotosBlock : @escaping (Bool?, Bool?, Bool?) -> ()) {
        ChoosePhotosBlock(false,false,false)
    }
    
    @IBAction func clickAction(_ sender: Any) {
        
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
        }else{
            print("读取相册错误")
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //            imagePost.image = image
        } else{
            print("Something went wrong")
        }
        
        //        self.dismiss(animated: true, completion: nil)
        
        print("aaaaa")
        
    
    }
    //选择图片成功后代理
     func imagePickerController(picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //获取选择的原图
//        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage

//        print(pickedImage)
//        //将选择的图片保存到Document目录下
//        let fileManager = NSFileManager.defaultManager()
//        let rootPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
//                                                           .UserDomainMask, true)[0] as String
//        let filePath = "\(rootPath)/pickedimage.jpg"
//        let imageData = UIImageJPEGRepresentation(pickedImage, 1.0)
//        fileManager.createFileAtPath(filePath, contents: imageData, attributes: nil)
//        
//        //上传图片
//        if (fileManager.fileExistsAtPath(filePath)){
//            //取得NSURL
//            let imageNSURL:NSURL = NSURL.init(fileURLWithPath: filePath)
//            
//            //使用Alamofire上传
//            Alamofire.upload(.POST, "http://www.hangge.com/upload.php", file: imageNSURL)
//                .responseString { response in
//                    print("Success: \(response.result.isSuccess)")
//                    print("Response String: \(response.result.value)")
//            }
//        }
//        
        //图片控制器退出
//        picker.dismiss(animated: true, completion:nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = TwoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

