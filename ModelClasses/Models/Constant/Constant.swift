//
//  Constant.swift
//  ModelClasses
//
//  Created by Hemant on 01/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import Foundation
import UIKit

var APP_NAME = "App Name"

var SERVER_DOMAIN_PATH = "http://wmsit.rathi.com/WMService/api"

var USER_DEFAULTS = UserDefaults.standard

var GET_TOKEN_COUNT   : Int = 0

var MAC_UUID : String = ""

var isInternetAvailable : Bool = false

extension UIViewController {
    
    func showAlert(title: String?, message: String?, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showInternetAlert(){
        
    let alertController = UIAlertController(title: "App Name", message: "There is no internet connection.", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
    UIAlertAction in
    print("OK Pressed")
    }
    alertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK:-  HUD Custom Method
     func showHud()  {
        DispatchQueue.main.async(execute: {() -> Void in
            SharedInstance.HUD  = MBProgressHUD.showAdded(to: self.view, animated: true)
            SharedInstance.HUD.label.text = ""
            SharedInstance.HUD.bezelView.color = UIColor.clear
        })
    }
    
     func hideHud() {
        DispatchQueue.main.async(execute: {() -> Void in
             if SharedInstance.HUD != nil {
                SharedInstance.HUD.hide(animated: true)
                SharedInstance.HUD.removeFromSuperview()
            }
        })
    }

}
