//
//  ViewController.swift
//  ModelClasses
//
//  Created by Hemant on 31/01/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {

    @IBOutlet var tblData : UITableView!
    
    var clients : [client] = []
    
    override func viewDidLoad() {
    super.viewDidLoad()
        
        let discParameters = NSMutableDictionary()
        let arrEntityDataList = NSMutableArray()
        let arrRequestDataList = NSMutableArray()
        
        let discRequestDataList = NSMutableDictionary()
        discParameters .setValue("1436743", forKey: "partyId")
        
        let discEntityDataList = NSMutableDictionary()
        discEntityDataList .setValue("clientListForRM", forKey: "entityName")
        discEntityDataList .setValue("1", forKey: "pageNo")
        discEntityDataList .setValue("100", forKey: "pageSize")
        
        discEntityDataList .setObject(arrRequestDataList, forKey: "requestDataList" as NSCopying)
        
        arrEntityDataList .add(discEntityDataList)
        discRequestDataList.setValue("14004", forKey: "contactTypeId")
        discRequestDataList.setValue("602004,602003,602007,602011,602009,602012,602008,602001,602010,602006,602002", forKey: "stageId")
    
        arrRequestDataList .add(discRequestDataList)
        discParameters .setObject(arrEntityDataList, forKey: "entityDataList" as NSCopying)
        print(discParameters)
        
        let urlStr = "\(SERVER_DOMAIN_PATH)/v6/BulkDataSync"
        WebService.sharedInstantAPI.webServiceCallMethod(parameters: discParameters, forWebServiceCall: urlStr, setHTTPMethod: "POST") { (responseData, isSuccess) in
            if isSuccess {
           
                var discResponseObject = NSDictionary()
                discResponseObject = (responseData.value(forKey: "responseObject")! as AnyObject) as! NSDictionary
                
                var arrEntityDataList = NSArray()
                arrEntityDataList = discResponseObject.value(forKey: "entityDataList") as! NSArray
                
                let tempDic = arrEntityDataList.object(at: 0) as! NSDictionary
                let responseDataDic = tempDic.object(forKey: "responseData") as! NSDictionary
                
                var discResponseData = NSDictionary()
                discResponseData = responseDataDic.value(forKey: "responseObject") as! NSDictionary
                
                var arrTmp = NSArray()
                arrTmp = discResponseData.value(forKey: "contactsList") as! NSArray
            
                print("CONTACTS LIST :",arrTmp)
                let jsonResposeData = JSON(arrTmp)
                for i in 0..<jsonResposeData.count{
                
                    let singleClient = client(clientJson: jsonResposeData[i])
                    self.clients .append(singleClient)
                    print(self.clients[i].firstName)
                }
            }else {
            print("Error")
            }
        }
    }
    
        
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

