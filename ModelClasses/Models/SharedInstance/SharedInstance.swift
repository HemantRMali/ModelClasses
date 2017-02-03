//
//  SharedInstance.swift
//  ModelClasses
//
//  Created by Hemant on 03/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import UIKit

class SharedInstance: NSObject {
    
     static var HUD : MBProgressHUD!
     static let sharedAPI = WebService()
}
