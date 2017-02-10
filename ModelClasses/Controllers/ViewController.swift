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
    
    //MARK:- ViewController Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        callWebserviceTOGetClientList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- IBActions
    @IBAction func actionReload(_ sender: UIButton) {
        
        self.clients = []
        callWebserviceTOGetClientList()
    }
    
    func callWebserviceTOGetClientList(){
        if isInternetAvailable {
            var discParameters = Dictionary<String, Any>()
            let arrEntityDataList = NSMutableArray()
            let arrRequestDataList = NSMutableArray()
            
            
            var discRequestDataList = Dictionary<String, Any>()
            discParameters.updateValue("1436743", forKey: "partyId") //1442405
            
            var discEntityDataList = Dictionary<String, Any>()
            discEntityDataList .updateValue("clientListForRM", forKey: "entityName")
            discEntityDataList .updateValue("1", forKey: "pageNo")
            discEntityDataList .updateValue("100", forKey: "pageSize")
            
            discEntityDataList .updateValue(arrRequestDataList, forKey: "requestDataList")
            
            arrEntityDataList .add(discEntityDataList)
            discRequestDataList.updateValue("14004", forKey: "contactTypeId")
        discRequestDataList.updateValue("602004,602003,602007,602011,602009,602012,602008,602001,602010,602006,602002", forKey: "stageId")
            
            arrRequestDataList.add(discRequestDataList)
            discParameters .updateValue(arrEntityDataList, forKey: "entityDataList")
            //print(JSON(discParameters))
            let urlStr = "\(SERVER_DOMAIN_PATH)/v6/BulkDataSync"
            
            showHud()
            SharedInstance.sharedAPI.webServiceCallMethod(parameters: discParameters, forWebServiceCall: urlStr, setHTTPMethod: "POST") { (responseData, isSuccess) in
                if isSuccess {
                    self.hideHud()
                    if responseData.value(forKey: "status") as! String == "success"{
                        
                        let resData = ResponseData.init(fromDictionary: responseData as! Dictionary<String, Any>)
                        /*let resObj = resData.responseObject
                        let entityDataList = resObj?.entityDataList[0]
                        let resDataEntity  = entityDataList?.responseData
                        let resObjEntity   = resDataEntity?.responseObject
                        let contactList    : Array<Any> = (resObjEntity?.contactsList)!*/
                        
                        let contactList  : Array<Any> = resData.responseObject.entityDataList[0].responseData.responseObject.contactsList
                        
                        for i in 0..<contactList.count{
                            let singleClient = contactList1[i]
                            self.clients .append(singleClient as! ContactsList)
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
    
   
    
}

