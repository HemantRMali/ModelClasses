//
//  StringExtension.swift
//  ModelClasses
//
//  Created by Hemant on 01/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import Foundation


extension String {

    func isEmptyString() -> Bool {
        
        if self.trimmingCharacters(in: CharacterSet.whitespaces).characters.count == 0{
            return true
        }
        return false
    }
}
