//
//  AppDelegate.swift
//  ModelClasses
//
//  Created by Hemant on 31/01/17.
//  Copyright © 2017 Hemant. All rights reserved.
// test commit - hemant

import UIKit
import ReachabilitySwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK:- VAR DECLARATION
    var window: UIWindow?
    var reachability = Reachability()!
    //MARK:- UIAPPLICATION DELEGATE METHODS
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Timer.scheduledTimer(timeInterval: 300, target: self, selector: #selector(UpdateToken), userInfo: nil, repeats: true)
        GetUUID()
        setupRechability()
        UpdateTokenConstanly()
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
    
    //MARK:- UPDATE TOKEN AFTER 5 MINS
    func UpdateToken() {
        
        let urlStr = "\(SERVER_DOMAIN_PATH)/v1/security/getToken/31010"
        
        SharedInstance.sharedAPI.webServiceGetMethod(forWebServiceCall: urlStr, setHTTPMethod: "GET") { (response, isSuccess) in
            if isSuccess{
                print("SUCCESS RESPONSE :",response)
                let strToken = response.value(forKey: "responseObject") as! String
                if strToken != "null" || !strToken.isEmptyString() {
                    USER_DEFAULTS.set(strToken as String, forKey: "Token")
                }else{
                    USER_DEFAULTS.set("", forKey: "Token")
                    if GET_TOKEN_COUNT < 1 {
                        if isInternetAvailable{
                            self.UpdateToken()
                            GET_TOKEN_COUNT += 1
                        }
                    }
                }
            }else {
                print("Token Error:",response)
            }
        }
    }
    
    //MARK: - GetUUID
    func GetUUID () {
        let uniqueIdentifier: String = UIDevice.current.identifierForVendor!.uuidString
        // IOS 6+
        print("UDID:: \(uniqueIdentifier)" )
        MAC_UUID = uniqueIdentifier
    }
    
    //MARK:- UpdateTokenConstanly
    func UpdateTokenConstanly() {
        let delayTime: DispatchTime = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        print("DelayTime:",delayTime)
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
            if isInternetAvailable{
                self.UpdateToken()
            }
        })
    }
    
    //MARK:- setupRechability
    func setupRechability(){
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: ReachabilityChangedNotification,
                                                  object: reachability)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged),name: ReachabilityChangedNotification,object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    //MARK:- reachabilityChanged
    func reachabilityChanged(note: NSNotification) {
        
        let reachability = note.object as! Reachability
        if reachability.isReachable {
            if reachability.isReachableViaWiFi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
            isInternetAvailable = true
            UpdateToken()
        } else {
            isInternetAvailable = false
            print("Network not reachable")
        }
    }
}

