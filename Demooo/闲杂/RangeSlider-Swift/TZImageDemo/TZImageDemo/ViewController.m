//
//  ViewController.m
//  TZImageDemo
//
//  Created by 陈旭 on 2017/3/31.
//  Copyright © 2017年 陈旭. All rights reserved.
//

#import "ViewController.h"
#import "TZImagePickerController.h"
#import "TestViewController.h"
@interface ViewController ()<TZImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    TestViewController *imagePickerVc = [[TestViewController alloc] initWithMaxImagesCount:1 columnNumber:4 delegate:self pushPhotoPickerVc:NO];
    
    
#pragma mark - 四类个性化设置，这些参数都可以不传，此时会走默认设置
//    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
//    
//    if (self.maxCountTF.text.integerValue > 1) {
//        // 1.设置目前已经选中的图片数组
//        imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
//    }
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
//
//    // 2. Set the appearance
//    // 2. 在这里设置imagePickerVc的外观
//    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
//    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
//    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
//    // imagePickerVc.navigationBar.translucent = NO;
//    
//    // 3. Set allow picking video & photo & originalPhoto or not
//    // 3. 设置是否可以选择视频/图片/原图
//    imagePickerVc.allowPickingVideo = self.allowPickingVideoSwitch.isOn;
//    imagePickerVc.allowPickingImage = self.allowPickingImageSwitch.isOn;
    imagePickerVc.allowPickingOriginalPhoto = YES;
//    imagePickerVc.allowPickingGif = self.allowPickingGifSwitch.isOn;
//    
//    // 4. 照片排列按修改时间升序
//    imagePickerVc.sortAscendingByModificationDate = self.sortAscendingSwitch.isOn;
//    
//    // imagePickerVc.minImagesCount = 3;
//    // imagePickerVc.alwaysEnableDoneBtn = YES;
//    
//    // imagePickerVc.minPhotoWidthSelectable = 3000;
//    // imagePickerVc.minPhotoHeightSelectable = 2000;
//    
//    /// 5. Single selection mode, valid when maxImagesCount = 1
//    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = YES;
    imagePickerVc.isStatusBarDefault = NO;
//    imagePickerVc.allowCrop = self.allowCropSwitch.isOn;
//    imagePickerVc.needCircleCrop = self.needCircleCropSwitch.isOn;
    imagePickerVc.circleCropRadius = 100;
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    //imagePickerVc.allowPreview = NO;
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
