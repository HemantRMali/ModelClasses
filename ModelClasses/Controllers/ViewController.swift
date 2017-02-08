//
//  ViewController.swift
//  ModelClasses
//
//  Created by Hemant on 31/01/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UIViewController {

    @IBOutlet weak var tblClientList: MCClientListTable!
    
    var clients : [client] = []
    var jsonResponseClientList : JSON? = nil
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        callWebserviceTOGetClientList()
    }
    
    @IBAction func actionReload(_ sender: UIButton) {
    
        self.clients = []
        callWebserviceTOGetClientList()
    }
    func callWebserviceTOGetClientList(){
        if isInternetAvailable {
            var discParameters = Dictionary<String, Any>()
            var arrEntityDataList  = Array<Any>()
            var arrRequestDataList = Array<Any>()
            
            var discRequestDataList = Dictionary<String, Any>()
            discParameters.updateValue("1436743", forKey: "partyId") //Dics
            
            var discEntityDataList = Dictionary<String, Any>()
            discEntityDataList .updateValue("clientListForRM", forKey: "entityName")
            discEntityDataList .updateValue("1", forKey: "pageNo")
            discEntityDataList .updateValue("100", forKey: "pageSize")
            
            discEntityDataList .updateValue(arrRequestDataList, forKey: "requestDataList")
            
            arrEntityDataList .append(discEntityDataList)
            discRequestDataList.updateValue("14004", forKey: "contactTypeId")
            discRequestDataList.updateValue("602004,602003,602007,602011,602009,602012,602008,602001,602010,602006,602002", forKey: "stageId")
            
            arrRequestDataList .append(discRequestDataList)
            discParameters .updateValue(arrEntityDataList, forKey: "entityDataList")
            let urlStr = "\(SERVER_DOMAIN_PATH)/v6/BulkDataSync"
            
            showHud()
            SharedInstance.sharedAPI.webServiceCallMethod(parameters: discParameters, forWebServiceCall: urlStr, setHTTPMethod: "POST") { (responseData, isSuccess) in
                if isSuccess {
                    self.hideHud()
                    if responseData.value(forKey: "status") as! String == "success"{
                        var discResponseObject = Dictionary<String, Any>()
                        discResponseObject = (responseData.value(forKey: "responseObject")! as AnyObject) as! Dictionary
                        
                        var arrEntityDataList = Array<Any>()
                        arrEntityDataList =  discResponseObject["entityDataList"] as!
                        Array
                        let tempDic = arrEntityDataList[0] as! Dictionary<String, Any>//arrEntityDataList.object(at: 0) as! Dictionary<String, Any>
                        let responseDataDic = tempDic["responseData"] as! Dictionary<String, Any>
                        var discResponseData = Dictionary<String, Any>()
                        discResponseData = responseDataDic["responseObject"] as! Dictionary<String, Any>
                        
                        var arrTmp = Array<Any>()
                        arrTmp = discResponseData["contactsList"] as! Array
                        
                        self.jsonResponseClientList = JSON(arrTmp)
                        for i in 0..<self.jsonResponseClientList!.count{
                            let singleClient = client(clientJson: self.jsonResponseClientList![i])
                            self.clients .append(singleClient)
                        }
                        self.tblClientList.dataSourceArray = self.clients
                    }else {
                        self.hideHud()
                        self.showAlert(title: APP_NAME, message: "Oops!!!, Someting went wrong.")
                        print("responseData:",responseData)
                    }
                    
                }else {
                    print("Error")
                }
            }
            
        }else{
            showInternetAlert()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

