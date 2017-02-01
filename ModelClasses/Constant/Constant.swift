//
//  Constant.swift
//  ModelClasses
//
//  Created by Hemant on 01/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import Foundation
import UIKit
var SERVER_DOMAIN_PATH = "http://wmsit.rathi.com/WMService/api"

var USER_DEFAULTS = UserDefaults.standard

var GET_TOKEN_COUNT   : Int = 0

var MAC_UUID : String = ""
// MARK: - GetUUID
func GetUUID () {
    
    let uniqueIdentifier: String = UIDevice.current.identifierForVendor!.uuidString
    // IOS 6+
    print("UDID:: \(uniqueIdentifier)" )
    MAC_UUID = uniqueIdentifier
}

    
