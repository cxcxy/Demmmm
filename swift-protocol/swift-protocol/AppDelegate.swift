//
//  AppDelegate.swift
//  swift-protocol
//
//  Created by 陈旭 on 2017/8/11.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        self.swizzlingMethod(clzz: UIViewController.self, oldSelector: #selector("viewWillAppear"), newSelector: #selector("newViewWillAppear"))
//        self.swizzling(UIViewController.self)
        return true
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

    func swizzlingMethod(clzz: AnyClass, oldSelector: Selector, newSelector: Selector) {
        let oldMethod = class_getInstanceMethod(clzz, oldSelector)
        let newMethod = class_getInstanceMethod(clzz, newSelector)
        
        method_exchangeImplementations(oldMethod, newMethod)
    }
    private func swizzling(_ view: UIViewController.Type) -> () {
        
        // get selectors
        let originalSelector = #selector(view.viewWillAppear)
        let swizzledSelector = #selector(view.newViewWillAppear)
//         extract methods from selector
        let originalMethod = class_getInstanceMethod(view, originalSelector)
        let swizzledMethod = class_getInstanceMethod(view, swizzledSelector)
        
//        class_replaceMethod(view, swizzledSelector, method_getTypeEncoding(originalMethod), method_getTypeEncoding(originalMethod))
        
        // exchange their implementation (swizzle)
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }

}

