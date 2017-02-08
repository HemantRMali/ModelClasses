//
//  Extenstions.swift
//  ModelClasses
//
//  Created by Hemant on 08/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import Foundation


//MARK:- NSMutableData EXTENSTION
extension NSMutableData {
    
    
    /// This function is use to append string to NSMutableData
    ///
    /// - Parameter string: The string to be added to the `NSMutableData`.
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

//MARK:- String EXTENSTION
extension String {
    
    func isEmptyString() -> Bool {
        
        if self.trimmingCharacters(in: CharacterSet.whitespaces).characters.count == 0{
            return true
        }
        return false
    }
}


//MARK:- UIViewController EXTENSTION
extension UIViewController {
    
    //MARK:-  Common alert method
    func showAlert(title: String?, message: String?, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:-  Common internet alert
    func showInternetAlert(){
        
        let alertController = UIAlertController(title: "App Name", message: "There is no internet connection.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            print("OK Pressed")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //MARK:-  HUD Custom Method
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
