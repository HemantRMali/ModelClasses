//
//  responseObject.swift
//  ModelClasses
//
//  Created by Hemant on 02/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import Foundation
import SwiftyJSON

class responseObject {

    var partyId : String = ""
    var entityDataList1 = entityDataList.self
    
    init(responseJson :JSON) {
        self.partyId = responseJson["partyId"].stringValue
        //self.entityDataList1 = responseJson["entityDataList"]
    }
    
}

class entityDataList{

    var entityDataList = entityDataListFirstObject()
    
    init(entityJson : JSON) {
      //  self.entityDataList = entityJson["entityDataList"]
    }
}

class entityDataListFirstObject{

    var lastSyncDateTime : String = ""
    var pageSize         : String = ""
    var entityName       : String = ""
    var pageNo           : String = ""
    var responseData1 = responseData.self

}

class responseData {
    
    var status : String = ""
    var reasonCode : String = ""
    var responseListObject : String = ""
    
    init(responseJson:JSON) {
        self.status = responseJson["status"].stringValue
        self.reasonCode = responseJson["reasonCode"].stringValue
        self.responseListObject = responseJson["responseListObject"].stringValue
    }
    
}

class responseObjectContacts {
    
  //  var contactSummaryList : String = ""
 //   var contactsList : String = ""
    
}

class contactSummaryList{
    var seqNo : String = ""
    var key : String = ""
    var value : String = ""
}
