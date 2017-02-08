//
//	EntityDataList.swift
//
//	Create by Hemant on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class EntityDataList : NSObject, NSCoding{

	var entityName : String!
	var lastSyncDateTime : String!
	var pageNo : Int!
	var pageSize : Int!
	var responseData : ResponseData!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: Dictionary<String, Any>){
		entityName = dictionary["entityName"] as? String
		lastSyncDateTime = dictionary["lastSyncDateTime"] as? String
		pageNo = dictionary["pageNo"] as? Int
		pageSize = dictionary["pageSize"] as? Int
		if let responseDataData = dictionary["responseData"]{
			responseData = ResponseData(fromDictionary: responseDataData as! Dictionary<String, Any>)
		}
	}

	/**
	 * Returns all the available property values in the form of Dictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> Dictionary<String, Any>
	{
		var dictionary = Dictionary<String, Any>()
		if entityName != nil{
			dictionary["entityName"] = entityName
		}
		if lastSyncDateTime != nil{
			dictionary["lastSyncDateTime"] = lastSyncDateTime
		}
		if pageNo != nil{
			dictionary["pageNo"] = pageNo
		}
		if pageSize != nil{
			dictionary["pageSize"] = pageSize
		}
		if responseData != nil{
			dictionary["responseData"] = responseData.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         entityName = aDecoder.decodeObject(forKey: "entityName") as? String
         lastSyncDateTime = aDecoder.decodeObject(forKey: "lastSyncDateTime") as? String
         pageNo = aDecoder.decodeObject(forKey: "pageNo") as? Int
         pageSize = aDecoder.decodeObject(forKey: "pageSize") as? Int
         responseData = aDecoder.decodeObject(forKey: "responseData") as? ResponseData

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if entityName != nil{
			aCoder.encode(entityName, forKey: "entityName")
		}
		if lastSyncDateTime != nil{
			aCoder.encode(lastSyncDateTime, forKey: "lastSyncDateTime")
		}
		if pageNo != nil{
			aCoder.encode(pageNo, forKey: "pageNo")
		}
		if pageSize != nil{
			aCoder.encode(pageSize, forKey: "pageSize")
		}
		if responseData != nil{
			aCoder.encode(responseData, forKey: "responseData")
		}

	}

}
