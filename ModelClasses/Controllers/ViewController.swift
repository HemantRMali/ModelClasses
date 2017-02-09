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
    
    var clients : [ContactsList] = []
    //var jsonResponseClientList : JSON? = nil
    
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
            var arrEntityDataList = Array<Any>()
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
            
            arrRequestDataList.append(discRequestDataList)
            discParameters .updateValue(arrEntityDataList, forKey: "entityDataList")
            //print(JSON(discParameters))
            let urlStr = "\(SERVER_DOMAIN_PATH)/v6/BulkDataSync"
            
            showHud()
            SharedInstance.sharedAPI.webServiceCallMethod(parameters: discParameters, forWebServiceCall: urlStr, setHTTPMethod: "POST") { (responseData, isSuccess) in
                if isSuccess {
                    self.hideHud()
                    if responseData.value(forKey: "status") as! String == "success"{
                        
                        let discResponseData = ResponseData(fromDictionary: responseData as! Dictionary<String, Any>)
                        
                        var discResponseObject = Dictionary<String, Any>()
                        discResponseObject = discResponseData.responseObject.toDictionary()
                        
                        var arrTmp = Array<Any>()
                        arrTmp = discResponseObject["contactsList"] as! Array
                        
                       for i in 0..<arrTmp.count{
                            let singleClient = ContactsList(fromDictionary: arrTmp[i] as! Dictionary<String, Any>)
                            self.clients .append(singleClient)
                        }
                        self.tblClientList.dataSourceArray = self.clients
                    }else {
                        self.hideHud()
                        self.showAlert(title: APP_NAME, message: "Oops!!!, Someting went wrong.")
                        print("responseData:",responseData)
                    }
                    
                }else {
                    self.hideHud()
                    self.showAlert(title: APP_NAME, message: "Oops!!!, Someting went wrong.")
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

