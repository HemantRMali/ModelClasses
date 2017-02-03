//
//	ResponseData.swift
//
//	Create by Hemant on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ResponseData : NSObject, NSCoding{

	var reasonCode : AnyObject!
	var responseListObject : AnyObject!
	var responseObject : ResponseObject!
	var status : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		reasonCode = dictionary["reasonCode"] as? AnyObject
		responseListObject = dictionary["responseListObject"] as? AnyObject
		if let responseObjectData = dictionary["responseObject"] as? NSDictionary{
			responseObject = ResponseObject(fromDictionary: responseObjectData)
		}
		status = dictionary["status"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if reasonCode != nil{
			dictionary["reasonCode"] = reasonCode
		}
		if responseListObject != nil{
			dictionary["responseListObject"] = responseListObject
		}
		if responseObject != nil{
			dictionary["responseObject"] = responseObject.toDictionary()
		}
		if status != nil{
			dictionary["status"] = status
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         reasonCode = aDecoder.decodeObject(forKey: "reasonCode") as? AnyObject
         responseListObject = aDecoder.decodeObject(forKey: "responseListObject") as? AnyObject
         responseObject = aDecoder.decodeObject(forKey: "responseObject") as? ResponseObject
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if reasonCode != nil{
			aCoder.encode(reasonCode, forKey: "reasonCode")
		}
		if responseListObject != nil{
			aCoder.encode(responseListObject, forKey: "responseListObject")
		}
		if responseObject != nil{
			aCoder.encode(responseObject, forKey: "responseObject")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}
