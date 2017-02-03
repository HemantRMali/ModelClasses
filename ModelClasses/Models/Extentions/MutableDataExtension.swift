//
//  MutableDataExtension.swift
//  ModelClasses
//
//  Created by Hemant on 01/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import Foundation

//MARK:- NSMutableData EXTENSTION
extension NSMutableData {
        func appendString(string: String) {
            let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
            append(data!)
    }
}
