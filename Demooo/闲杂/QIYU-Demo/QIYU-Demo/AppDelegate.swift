//
//  AppDelegate.swift
//  QIYU-Demo
//
//  Created by 陈旭 on 2017/3/17.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit
import UserNotifications
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,QYConversationManagerDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        QYSDK.shared().registerAppId("2d910b7e1775b42f797b28c701618660", appName: "尖叫设计")
        QYSDK.shared().conversationManager().setDelegate(self)
        let massageCount = QYSDK.shared().conversationManager().allUnreadCount()
        messageCountView(massageCount)
        
        registerAppNotificationSettings(launchOptions: launchOptions)

        return true
    }
    private func registerAppNotificationSettings(launchOptions: Any?) {
        if #available(iOS 10.0, *) {
            let notifiCenter = UNUserNotificationCenter.current()
            notifiCenter.delegate = self
            let types = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
            notifiCenter.requestAuthorization(options: types) { (flag, error) in
                if flag {
//                    MPrintLog("iOS request notification success")
                }else{
//                    MPrintLog(" iOS 10 request notification fail")
                }
            }
        } else { //iOS8,iOS9注册通知
            let settings = UIUserNotificationSettings(types: [.alert, .badge , .sound], categories: nil)

            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        UIApplication.shared.registerForRemoteNotifications()
    }
    func messageCountView(_ count: Int)  {
        print(count)
        if count == 0 {
            WOWCustormMessageView.dissMissView()
        }else {
            WOWCustormMessageView.show()
        }
    }
    func onUnreadCountChanged(_ count: Int) {
        
        messageCountView(count)
       
    }
    @available(iOS 10.0, *)
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void)
    {
        
        let userInfo = response.notification.request.content.userInfo
        if response.notification.request.trigger is UNPushNotificationTrigger {

            let sessionViewController = QYSDK.shared().sessionViewController()
            sessionViewController?.sessionTitle = "qqqq"
   
            sessionViewController?.hidesBottomBarWhenPushed = true
            QYCustomActionConfig.sharedInstance().linkClickBlock = {(str) in
                print(str ?? "")
                let vc = GoodsDetailsVC()
                
                sessionViewController?.navigationController?.pushViewController(vc, animated: true)
                
            }
            QYSDK.shared().customUIConfig().customerMessageBubbleNormalImage = UIImage.init(named: "normal-custorm")?.resizableImage(withCapInsets: UIEdgeInsetsMake(15, 15, 30, 30), resizingMode: .tile)
            
           FNUtil.currentTopViewController().navigationController?.pushViewController(sessionViewController!, animated: true)
            
            //应用处于后台时的远程推送接受
//            pushController(userInfo: userInfo)

 
        }else{
            //应用处于后台时的本地推送接受
            
        }
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        QYSDK.shared().updateApnsToken(deviceToken)
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
// 6228482381534683711

}
public class FNUtil {
    //获取当前页面
    public class func currentTopViewController() -> UIViewController {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        return currentTopViewController(rootViewController: rootViewController!)
    }
    
    public class func currentTopViewController(rootViewController: UIViewController) -> UIViewController {
        if (rootViewController.isKind(of: UITabBarController.self)) {
            let tabBarController = rootViewController as! UITabBarController
            return currentTopViewController(rootViewController: tabBarController.selectedViewController!)
        }
        
        if (rootViewController.isKind(of: UINavigationController.self)) {
            let navigationController = rootViewController as! UINavigationController
            return currentTopViewController(rootViewController: navigationController.visibleViewController!)
        }
        
        if ((rootViewController.presentedViewController) != nil) {
            return currentTopViewController(rootViewController: rootViewController.presentedViewController!)
        }
        return rootViewController
    }
}
