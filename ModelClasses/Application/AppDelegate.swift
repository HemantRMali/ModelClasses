//
//  AppDelegate.swift
//  ModelClasses
//
//  Created by Hemant on 31/01/17.
//  Copyright © 2017 Hemant. All rights reserved.
// test commit - hemant

import UIKit
import Alamofire
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK:- VAR DECLARATION
    var window: UIWindow?
    let webServiceCodeBlock = WebService()
    
    //MARK:- UIAPPLICATION DELEGATE METHODS
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
         Timer.scheduledTimer(timeInterval: 300, target: self, selector: #selector(UpdateToken), userInfo: nil, repeats: true)
        UpdateToken()
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
        /*Alamofire.request(urlStr, method: .get, parameters: ["":""], encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    var res : NSDictionary? = nil
                    res = response.result.value! as? NSDictionary
                    
                    if res?.value(forKey: "status") as! String == "success"{
                        let strToken : String = res!.value(forKey: "responseObject")! as! String
                        if strToken != "null" || !strToken.isEmptyString() {
                            USER_DEFAULTS.set(strToken, forKey: "Token")
                        }else{
                            USER_DEFAULTS.set("", forKey: "Token")
                            if GET_TOKEN_COUNT < 1 {
                                self.UpdateToken()
                               GET_TOKEN_COUNT += 1
                            }
                        }
                    }
                }
                break
            case .failure(_):
                print(response.result.error!)
                break
                
            }
        }*/
        
        webServiceCodeBlock.webServiceCallMethod(parameters: NSDictionary(), forWebServiceCall: urlStr, setHTTPMethod: "GET") { (response, isSuccess) in
            if isSuccess{
            print("SUCCESS RESPONSE :",response)
                let strToken = response.value(forKey: "responseObject") as! String
                if strToken != "null" || !strToken.isEmptyString() {
                    USER_DEFAULTS.set(strToken as String, forKey: "Token")
                    print(USER_DEFAULTS.value(forKey: "Token")!)
                }else{
                    USER_DEFAULTS.set("", forKey: "Token")
                    if GET_TOKEN_COUNT < 1 {
                        self.UpdateToken()
                        GET_TOKEN_COUNT += 1
                    }
                }
            }else {
            print("ERROR")
            }
        }
    }
}

