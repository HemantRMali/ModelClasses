//
//	ContactSummaryList.swift
//
//	Create by Hemant on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ContactSummaryList : NSObject, NSCoding{

	var key : String!
	var seqNo : Int!
	var value : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: Dictionary<String, Any>){
		key = dictionary["key"] as? String
		seqNo = dictionary["seqNo"] as? Int
		value = dictionary["value"] as? String
	}

	/**
	 * Returns all the available property values in the form of Dictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> Dictionary<String, Any>
	{
		var dictionary = Dictionary<String, Any>()
		if key != nil{
			dictionary["key"] = key
		}
		if seqNo != nil{
			dictionary["seqNo"] = seqNo
		}
		if value != nil{
			dictionary["value"] = value
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         key = aDecoder.decodeObject(forKey: "key") as? String
         seqNo = aDecoder.decodeObject(forKey: "seqNo") as? Int
         value = aDecoder.decodeObject(forKey: "value") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if key != nil{
			aCoder.encode(key, forKey: "key")
		}
		if seqNo != nil{
			aCoder.encode(seqNo, forKey: "seqNo")
		}
		if value != nil{
			aCoder.encode(value, forKey: "value")
		}

	}

}
