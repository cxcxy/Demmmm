//
//  TweaksPhotoViewController.swift
//  PhotoTweaks-Demo
//
//  Created by 陈旭 on 2017/3/25.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

class TweaksPhotoViewController: UIViewController {
    /**
     Image to process.
     */
    private(set) var image: UIImage?
    /**
     Flag indicating whether the image cropped will be saved to photo library automatically. Defaults to YES.
     */
    var isAutoSaveToLibray: Bool = false
    /**
     Max rotation angle
     */
    var maxRotationAngle: CGFloat = 0.0
    /**
     The optional photo tweaks controller delegate.
     */
    weak var delegate: PhotoTweaksViewControllerDelegate?
    /**
     Save action button's default title color
     */
    var saveButtonTitleColor: UIColor?
    /**
     Save action button's highlight title color
     */
    var saveButtonHighlightTitleColor: UIColor?
    /**
     Cancel action button's default title color
     */
    var cancelButtonTitleColor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = TwoTestViewController()
        self.present(vc, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
