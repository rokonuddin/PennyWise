//
//  AppDelegate.swift
//  PennyWise
//
//  Created by Mohammed Rokon Uddin on 12/10/17.
//  Copyright © 2017 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

// Globals
let π = CGFloat(Double.pi)

let lightViewColor = UIColor(red: 165/255, green: 193/255, blue: 207/255, alpha: 1.0)
let darkViewColor = UIColor(red: 145/255, green: 175/255, blue: 191/255, alpha: 1.0)

let darkTextColor = UIColor(red: 79/255, green: 92/255, blue: 105/255, alpha: 1.0)
let cellSelectedColor = UIColor(red: 79/255, green: 92/255, blue: 105/255, alpha: 1.0)
let buttonEnabledColor = UIColor(red: 246/255, green: 158/255, blue: 81/255, alpha: 1.0)

let appGreenColor = UIColor(red: 146/255, green: 203/255, blue: 149/255, alpha: 1.0)
let appOrangeColor = UIColor(red: 249/255, green: 158/255, blue: 78/255, alpha: 1.0)
let appRedColor = UIColor(red: 1.0, green: 107/255, blue: 107/255, alpha: 1.0)

let cellGradientStart = UIColor(red: 94/255, green: 219/255, blue: 159/255, alpha: 1.0)
let cellGradientEnd = UIColor(red: 171/255, green: 227/255, blue: 1.0, alpha: 1.0)


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
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


}

