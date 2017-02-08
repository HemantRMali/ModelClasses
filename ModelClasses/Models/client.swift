//
//  client.swift
//  ModelClasses
//
//  Created by Hemant on 02/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import Foundation
import SwiftyJSON
class client{

    var firstName : String  = ""
    var lastName  : String  = ""
    var address1  : String  = ""
    var address2  : String  = ""
    var address3  : String  = ""
    var mobileNo  : String  = ""
    var partyId   : String  = ""
    var email     : String  = ""
    var documentList = clientDocumentList?.self
    init(clientJson:JSON) {
        self.firstName = clientJson["firstName"].stringValue
        self.lastName  = clientJson["lastName"].stringValue
        self.address1  = clientJson["address1"].stringValue
        self.address2  = clientJson["address2"].stringValue
        self.address3  = clientJson["address3"].stringValue
        self.partyId   = clientJson["partyId"].stringValue
        self.email     = clientJson["email"].stringValue
    }
}



class clientDocumentList{

    var firstName           : String = ""
    var documentName        : String = ""
    var fileStoragePathURI  : String = ""
    var documentStatus      : String = ""
    
    init(clientDocJson:JSON) {
        self.firstName = clientDocJson["firstName"].stringValue
        self.documentName = clientDocJson["documentName"].stringValue
        self.fileStoragePathURI = clientDocJson["fileStoragePathURI"].stringValue
        self.documentStatus = clientDocJson["documentStatus"].stringValue
    }
}
