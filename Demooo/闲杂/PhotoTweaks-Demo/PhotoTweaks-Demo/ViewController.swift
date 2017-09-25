//
//  ViewController.swift
//  PhotoTweaks-Demo
//
//  Created by 陈旭 on 2017/3/22.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,PhotoTweaksViewControllerDelegate,UITableViewDelegate,UITableViewDataSource,TZImagePickerControllerDelegate {

    @IBOutlet weak var testBtn: UIButton!
    @IBOutlet weak var testImg: UIImageView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    let RefundArray:[Int:String] = [1:"尺码拍错／不喜欢／不想要",2:"空包裹",3:"未按约定时间发货",4: "快递／物流一直未送到",5: "退运费",6: "做工有瑕疵",7: "质量问题（开胶／掉色)",8: "尺寸／型号／功能／颜色／图案／款式与商品页面描述不符",9: "少件／漏发",10: "卖家发错货",11: "包装／商品破损／污渍／变形",12: "未按约定时间发货",13: "7天无理由退换货",14: "平台发错货"]
    
//    let imagePickerVc:TZImagePickerController
    var lastContentOffset :CGFloat = 0.0
    var hidden : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let data = Data.init(count: <#T##Int#>
        print(RefundArray)
        let nowDate = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.string(from: nowDate as Date)
        print(dateString)
        
        self.tableView.rowHeight          = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 410
        tableView.decelerationRate = UIScrollViewDecelerationRateFast
        tableView.register(UINib.init(nibName: "TextDetailCell", bundle: Bundle.main), forCellReuseIdentifier: "TextDetailCell")
        
        //搜索按钮
        let button1 = UIButton(frame:CGRect.init(x: 0, y: 0, width: 50, height: 18))
        
        //        button1.setImage(UIImage(named: "search"), forState: .Normal)
        button1.setTitle("下一步", for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button1.backgroundColor = UIColor.red
        button1.addTarget(self,action:#selector(clickAction),for:.touchUpInside)

        let barItem = UIBarButtonItem.init(customView: button1)
        self.navigationItem.rightBarButtonItem = barItem
//        self.navigationItem.rightBarButtonItem = UIBar
//        start(delay: 5) {
//            print("5秒结束")
//        }
    }
    
    func start(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    lazy var sharePhotoView:WOWSharePhotoView = {
        let v = Bundle.main.loadNibNamed(String(describing: WOWSharePhotoView.self), owner: self, options: nil)?.last as! WOWSharePhotoView
//        v.lbMyName.text =  "hahah"
        return v
    }()
    
    func createViewImage(_ shareView: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(shareView.bounds.size, false, UIScreen.main.scale)
        shareView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    @IBAction func clickAction(_ sender: Any) {
       
        
    }
    func aa(){
        
    }
    func tz_imagePickerControllerDidCancel(_ picker: TZImagePickerController!) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
//        TZImageManager.getPhotoWithAsset(<#T##TZImageManager#>)
//        TZImageManager.manager().getOriginalPhotoWithAsset(assets[0], completion: {(photo: UIImage, info: [NSObject : AnyObject]) -> Void in
//            print("")
//        })
        

    }
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool, infos: [[AnyHashable : Any]]!) {
        //获取选择的原图
//        let pickedImage = infos[0][UIImagePickerControllerOriginalImage] as! UIImage
//        
//        print(pickedImage.size.width,pickedImage.size.height)
//        picker.dismiss(animated: true, completion:nil)

    }
    func photoTweaksController(_ controller: PhotoTweaksViewController, didFinishWithCroppedImage croppedImage: UIImage) {
        
        print("\(croppedImage.size.width)--\(croppedImage.size.height)")
        controller.navigationController?.popViewController(animated: true)
    }
//    https://img.wowdsgn.com/social/insta/KYUnIA_dimension_750.0x562.0
    func photoTweaksControllerDidCancel(_ controller: PhotoTweaksViewController) {
        
        controller.navigationController?.popViewController(animated: true)
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell                = tableView.dequeueReusableCell(withIdentifier: "TextDetailCell", for: indexPath) as! TextDetailCell
        cell.heightConstraint.constant = 200
        cell.btnTest.isHidden = true
//        cell.stackHeight.constant = 0
        return cell
        
        
    }
    func fromAlbum(){
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
        //获取选择的原图
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let photoTweaksViewController = PhotoTweaksViewController(image: pickedImage)
        photoTweaksViewController?.delegate = self
        photoTweaksViewController?.autoSaveToLibray = false
        picker.pushViewController(photoTweaksViewController!, animated: true)
        
        print(pickedImage.size.width,pickedImage.size.height)
//           picker.dismiss(animated: true, completion:nil)
    }
//    //选择图片成功后代理
//    private func imagePickerController(picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        //获取选择的原图
//        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        
//        print(pickedImage.size.width,pickedImage.size.height)
//        
////        //将选择的图片保存到Document目录下
////        let fileManager = FileManager.default
////        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
////                                                           .userDomainMask, true)[0] as String
////        let filePath = "\(rootPath)/pickedimage.jpg"
////        let imageData = UIImageJPEGRepresentation(pickedImage, 1.0)
////        fileManager.createFile(atPath: filePath, contents: imageData, attributes: nil)
//        
////        //上传图片
////        if (fileManager.fileExistsAtPath(filePath)){
////            //取得NSURL
////            let imageNSURL:NSURL = NSURL.init(fileURLWithPath: filePath)
////            
////            //使用Alamofire上传
////            Alamofire.upload(.POST, "http://www.hangge.com/upload.php", file: imageNSURL)
////                .responseString { response in
////                    print("Success: \(response.result.isSuccess)")
////                    print("Response String: \(response.result.value)")
////            }
////        }
//        
//        //图片控制器退出
//        picker.dismiss(animated: true, completion:nil)
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
//        let imagePickerVc = TZImagePickerController.init(maxImagesCount: 1, columnNumber: 5, delegate: self, pushPhotoPickerVc: true)
//        imagePickerVc?.isSelectOriginalPhoto            = false
//        
//        imagePickerVc?.barItemTextColor                 = UIColor.black
//        imagePickerVc?.navigationBar.barTintColor       = UIColor.black
//        imagePickerVc?.navigationBar.tintColor          = UIColor.black
//        
//        imagePickerVc?.navigationController?.navigationBar.isTranslucent = false
//        imagePickerVc?.automaticallyAdjustsScrollViewInsets = true
//
//        imagePickerVc?.allowTakePicture     = true // 拍照按钮将隐藏,用户将不能在选择器中拍照
//        imagePickerVc?.allowPickingVideo    = false// 用户将不能选择发送视频
//        imagePickerVc?.allowPickingImage    = true // 用户可以选择发送图片
//        imagePickerVc?.allowPickingOriginalPhoto = true// 用户不能选择发送原图
//        imagePickerVc?.sortAscendingByModificationDate = false// 是否按照时间排序
//        imagePickerVc?.autoDismiss      = false // 不自动dismiss
//        imagePickerVc?.allowPreview     = true // 不预览图片
//        imagePickerVc?.showSelectBtn    = true // 展示完成按钮
//        imagePickerVc?.didFinishPickingPhotosHandle = {[weak self](images,asstes,isupdete) in
//            if let strongSelf = self {
//               
//
//            }

//        }
        
        let vc = WOWImagePickerController.getPicker()
//        vc.pickerDelegate = self
        vc.didFinishPickingPhotosHandle = {(images,asstes,isupdete) in
       
            print(images,asstes)
            
        }
        present(vc, animated: true, completion: nil)


    }
    
    
    func getDispatchPhoto(asset:PHAsset)  {
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.deliveryMode = .highQualityFormat
        options.isNetworkAccessAllowed = true
        PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .default, options: options) { [weak self](result, info) -> Void in
            if let image = result,let strongSelf = self {
                // 处理获得的图片
                let h = image.size.height
                let w = image.size.width
                if h > 1000 && w > 1000 {
                    let photoTweaksViewController = PhotoTweaksViewController(image: image)
                    photoTweaksViewController?.delegate = strongSelf
                    photoTweaksViewController?.autoSaveToLibray = false
//                    
//                    nav.pushViewController(photoTweaksViewController!, animated: true)
                }else {
                    print("请重新选择照片")
                }

            }
        }
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
           NSObject.cancelPreviousPerformRequests(withTarget: self)

        
                
                if self.testBtn.alpha < 1 {
                    self.changeState(alpha: 1)

                    
                }


    }

    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        NSObject.cancelPreviousPerformRequests(withTarget: self)
//        self.perform(#selector(scrollViewDidEndScrollingAnimation), with: nil, afterDelay: 0.5)
//        let a = scrollView.contentOffset.y
////        lastContentOffset = scrollView.contentOffset.y
//        if a -  lastContentOffset  > 20 && a > 0{
//            //            print("shang")
//            lastContentOffset = a
////            if hidden == false {
//            
//            if self.testBtn.alpha >= 0.95 {
//                changeState(alpha: 0.01)
//                hidden = true
//                  print("--------0.01")
//            }
//            
////            }
////            changeState(alpha: 0.01)
////            hidden = true
//            return
//        }else if lastContentOffset - a > 20 && (a  <= scrollView.contentSize.height-scrollView.bounds.size.height-20) {
//             lastContentOffset = a
////            if hidden {
//            
//             if self.testBtn.alpha < 1 {
//                    changeState(alpha: 1)
//                    hidden = false
//
//            }
////            }
//          
//            return
//        }
//        
        let a = scrollView.contentOffset.y
        
        if a -  lastContentOffset  > 20 && a > 0{
            
            lastContentOffset = a
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            
          
        }else if lastContentOffset - a > 20 && (a  <= scrollView.contentSize.height-scrollView.bounds.size.height-20) {
            lastContentOffset = a
            
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            
            
         
        }

        
    }
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//          let a = scrollView.contentOffset.y
//        if a -  lastContentOffset  > 50{
//            //            print("shang")
//            lastContentOffset = a
//            hidden = true
//            changeState(alpha: 0)
//            return
//        }else if lastContentOffset - a > 50 {
//            lastContentOffset = a
//            hidden = false
//            changeState(alpha: 1)
//            return
//        }
//        
//
//    }
//
    func changeState(alpha:CGFloat)  {
        self.testBtn.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.3) {

            self.testBtn.transform = CGAffineTransform(scaleX: alpha, y: alpha)
     
            self.testBtn.alpha = alpha

        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
class WOWImagePickerController:NSObject, TZImagePickerControllerDelegate {

   class func getPicker() -> TZImagePickerController {

        let imagePickerVc = TZImagePickerController.init(maxImagesCount: 1, columnNumber: 5, delegate: self as? TZImagePickerControllerDelegate, pushPhotoPickerVc: true)
    

        imagePickerVc?.isSelectOriginalPhoto            = false
        
        imagePickerVc?.barItemTextColor                 = UIColor.black
        imagePickerVc?.navigationBar.barTintColor       = UIColor.black
        imagePickerVc?.navigationBar.tintColor          = UIColor.black
        
        imagePickerVc?.navigationController?.navigationBar.isTranslucent = false
        imagePickerVc?.automaticallyAdjustsScrollViewInsets = true
        
        imagePickerVc?.allowTakePicture     = true // 拍照按钮将隐藏,用户将不能在选择器中拍照
        imagePickerVc?.allowPickingVideo    = false// 用户将不能选择发送视频
        imagePickerVc?.allowPickingImage    = true // 用户可以选择发送图片
        imagePickerVc?.allowPickingOriginalPhoto = true// 用户不能选择发送原图
        imagePickerVc?.sortAscendingByModificationDate = false// 是否按照时间排序
        imagePickerVc?.autoDismiss      = true // 不自动dismiss
        imagePickerVc?.allowPreview     = true // 不预览图片
        imagePickerVc?.showSelectBtn    = true // 展示完成按钮

        return imagePickerVc!
    }

    
}
class PhotoContentView:UIView {
    var imageView: UIImageView?
    var image: UIImage?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        self.image = image
        self.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(image.size.width), height: CGFloat(image.size.height))
        imageView = UIImageView(frame: bounds)
        imageView?.image = self.image
        imageView?.isUserInteractionEnabled = true
        addSubview(imageView!)
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = bounds
    }
}
