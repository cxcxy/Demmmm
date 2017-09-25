//
//  PhotoTweaksViewController.m
//  PhotoTweaks
//
//  Created by Tu You on 14/12/5.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "PhotoTweaksViewController.h"
#import "PhotoTweakView.h"
#import "UIColor+Tweak.h"
#import <AssetsLibrary/AssetsLibrary.h>
#define DV_W ([UIScreen mainScreen].bounds.size.width)
#define DV_H ([UIScreen mainScreen].bounds.size.height)
#define kDeviceScale [UIScreen mainScreen].scale
@interface PhotoTweaksViewController ()

@property (strong, nonatomic) PhotoTweakView *photoView;

@end

@implementation PhotoTweaksViewController

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super init]) {
        _image = image;
        _autoSaveToLibray = YES;
        _maxRotationAngle = kMaxRotationAngle;
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

//    [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleDefault;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//    [self setNeedsStatusBarAppearanceUpdate];
    
}
//- (void)setNeedsStatusBarAppearanceUpdate{
//     [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleDefault;
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self savePhotoLibrary:self.image];
    
    [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleDefault;

    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.title = @"编辑图片";
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0,0,60,30)];
    //设置按钮标题
    [button setTitle:@"返回" forState:UIControlStateNormal];
    //设置按钮标题颜色
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //设置按钮标题字体
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    //添加点击事件
    [button addTarget:self action:@selector(cancelBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    //设置导航栏左按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIButton *regihtbutton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,60,30)];
    //设置按钮标题
    [regihtbutton setTitle:@"下一步" forState:UIControlStateNormal];
    //设置按钮标题颜色
    [regihtbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //设置按钮标题字体
    regihtbutton.titleLabel.font = [UIFont systemFontOfSize:12];
    //添加点击事件
    [regihtbutton addTarget:self action:@selector(saveBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    //设置导航栏左按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:regihtbutton];
    
    self.view.clipsToBounds = YES;
    self.view.backgroundColor = [UIColor photoTweakCanvasBackgroundColor];

    [self setupSubviews];
}
- (void)configTopView{
    UIView *viewTop = [UIView new];
    viewTop.frame = CGRectMake(0, 0, DV_W, 64);
    viewTop.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewTop];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 60, 64);
    backBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(cancelBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    [viewTop addSubview:backBtn];
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(DV_W - 60, 0, 60, 64);
    nextBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(saveBtnTapped) forControlEvents:UIControlEventTouchUpInside];
    [viewTop addSubview:nextBtn];
    UILabel *lbTitle = [[UILabel alloc] initWithFrame:CGRectMake(DV_W/2, 0, 100, 64)];
    lbTitle.textColor = [UIColor blackColor];
    lbTitle.textAlignment = NSTextAlignmentCenter;
    lbTitle.text = @"编辑图片";
    [viewTop addSubview:lbTitle];
    
    
}
- (void)setupSubviews
{
    self.photoView = [[PhotoTweakView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) image:self.image maxRotationAngle:self.maxRotationAngle];
//    self.photoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.photoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.photoView];
    
//    [self configTopView];

}

- (void)cancelBtnTapped
{
    [self.delegate photoTweaksControllerDidCancel:self];
}
- (void)savePhotoLibrary:(UIImage *)image
{
    
    
    
    NSLog(@"--%f--%f--%f",image.scale,image.size.width,image.size.height);
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library writeImageToSavedPhotosAlbum:self.image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
        if (!error) {
        }
    }];
}
- (void)saveBtnTapped
{
    if (self.photoView.isCrop) {

        [self.delegate photoTweaksController:self didFinishWithCroppedImage:self.image];
        return;
    }
    CGAffineTransform transform = CGAffineTransformIdentity;

    // translate
    CGPoint translation = [self.photoView photoTranslation];
    transform = CGAffineTransformTranslate(transform, translation.x, translation.y);

    // rotate
    transform = CGAffineTransformRotate(transform, self.photoView.angle);

    // scale
    CGAffineTransform t = self.photoView.photoContentView.transform;
    CGFloat xScale =  sqrt(t.a * t.a + t.c * t.c);
    CGFloat yScale = sqrt(t.b * t.b + t.d * t.d);
    transform = CGAffineTransformScale(transform, xScale, yScale);

    CGImageRef imageRef = [self newTransformedImage:transform
                                        sourceImage:self.image.CGImage
                                         sourceSize:self.image.size
                                  sourceOrientation:self.image.imageOrientation
                                        outputWidth:self.image.size.width
                                           cropSize:self.photoView.cropView.frame.size
                                      imageViewSize:self.photoView.photoContentView.bounds.size];
 
    
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);

//    if (self.autoSaveToLibray) {
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
        [library writeImageToSavedPhotosAlbum:image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error) {
            if (!error) {
            }
        }];
//    }

    [self.delegate photoTweaksController:self didFinishWithCroppedImage:image];
}

- (CGImageRef)newScaledImage:(CGImageRef)source withOrientation:(UIImageOrientation)orientation toSize:(CGSize)size withQuality:(CGInterpolationQuality)quality
{
    CGSize srcSize = size;
    CGFloat rotation = 0.0;

    switch(orientation)
    {
        case UIImageOrientationUp: {
            rotation = 0;
        } break;
        case UIImageOrientationDown: {
            rotation = M_PI;
        } break;
        case UIImageOrientationLeft:{
            rotation = M_PI_2;
            srcSize = CGSizeMake(size.height, size.width);
        } break;
        case UIImageOrientationRight: {
            rotation = -M_PI_2;
            srcSize = CGSizeMake(size.height, size.width);
        } break;
        default:
            break;
    }

    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 size.width,
                                                 size.height,
                                                 8,  //CGImageGetBitsPerComponent(source),
                                                 0,
                                                 rgbColorSpace,//CGImageGetColorSpace(source),
                                                 kCGImageAlphaPremultipliedLast|kCGBitmapByteOrder32Big//(CGBitmapInfo)kCGImageAlphaNoneSkipFirst  //CGImageGetBitmapInfo(source)
                                                 );
    CGColorSpaceRelease(rgbColorSpace);

    CGContextSetInterpolationQuality(context, quality);
    CGContextTranslateCTM(context,  size.width/2,  size.height/2);
    CGContextRotateCTM(context,rotation);

    CGContextDrawImage(context, CGRectMake(-srcSize.width/2 ,
                                           -srcSize.height/2,
                                           srcSize.width,
                                           srcSize.height),
                       source);
//    CGContextDrawImage(<#CGContextRef  _Nullable c#>, <#CGRect rect#>, <#CGImageRef  _Nullable image#>)
    CGImageRef resultRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);

    return resultRef;
}

- (CGImageRef)newTransformedImage:(CGAffineTransform)transform
                      sourceImage:(CGImageRef)sourceImage
                       sourceSize:(CGSize)sourceSize
                sourceOrientation:(UIImageOrientation)sourceOrientation
                      outputWidth:(CGFloat)outputWidth
                         cropSize:(CGSize)cropSize
                    imageViewSize:(CGSize)imageViewSize
{
    CGImageRef source = [self newScaledImage:sourceImage
                             withOrientation:sourceOrientation
                                      toSize:sourceSize
                                 withQuality:kCGInterpolationNone];

    CGFloat aspect = cropSize.height/cropSize.width;
    CGSize outputSize = CGSizeMake(outputWidth, outputWidth*aspect);

    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 outputSize.width,
                                                 outputSize.height,
                                                 CGImageGetBitsPerComponent(source),
                                                 0,
                                                 CGImageGetColorSpace(source),
                                                 CGImageGetBitmapInfo(source));
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, outputSize.width, outputSize.height));

    CGAffineTransform uiCoords = CGAffineTransformMakeScale(outputSize.width / cropSize.width,
                                                            outputSize.height / cropSize.height);
    uiCoords = CGAffineTransformTranslate(uiCoords, cropSize.width/2.0, cropSize.height / 2.0);
    uiCoords = CGAffineTransformScale(uiCoords, 1.0, -1.0);
    CGContextConcatCTM(context, uiCoords);

    CGContextConcatCTM(context, transform);
    CGContextScaleCTM(context, 1.0, -1.0);
    
//    UIGraphicsBeginImageContextWithOptions(outputSize,NO,[UIScreen mainScreen].scale);
    
    
    
    CGContextDrawImage(context, CGRectMake(-imageViewSize.width/2.0 ,
                                           -imageViewSize.height/2.0,
                                           imageViewSize.width ,
                                           imageViewSize.height)
                       , source);

    CGImageRef resultRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGImageRelease(source);
    return resultRef;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
