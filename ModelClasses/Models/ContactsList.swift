//
//  ContactsList.swift
//  ModelClasses
//
//  Created by Hemant on 09/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import Foundation
import SwiftyJSON
class  ContactsList{
    
    var firstName : String  = ""
    var lastName  : String  = ""
    var address1  : String  = ""
    var address2  : String  = ""
    var address3  : String  = ""
    var mobileNo  : String  = ""
    var partyId   : String  = ""
    var email     : String  = ""
    var documentList = clientDocumentList?.self
    init(clientJson:Dictionary<String,Any>) {
        self.firstName = clientJson["firstName"] as! String
        self.lastName  = clientJson["lastName"] as! String
        self.address1  = clientJson["address1"] as! String
        self.address2  = clientJson["address2"] as! String
        self.address3  = clientJson["address3"] as! String
        self.partyId   = clientJson["partyId"] as! String
        self.email     = clientJson["email"] as! String
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
