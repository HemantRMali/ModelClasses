//
//	ResponseObject.swift
//
//	Create by Hemant on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ResponseObject : NSObject, NSCoding{

	var contactSummaryList : [ContactSummaryList]!
	var contactsList : [ContactsList]!
	var entityDataList : [EntityDataList]!
	var partyId : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: Dictionary<String, Any>){
		contactSummaryList = [ContactSummaryList]()
		if let contactSummaryListArray = dictionary["contactSummaryList"]{
			for dic in contactSummaryListArray as! Array<Any>{
				let value = ContactSummaryList(fromDictionary: dic as! Dictionary<String, Any>)
				contactSummaryList.append(value)
			}
		}
		contactsList = [ContactsList]()
		if let contactsListArray = dictionary["contactsList"]{
			for dic in contactsListArray as! Array<Dictionary<String, Any>>{
				let value = ContactsList(fromDictionary: dic)
				contactsList.append(value)
			}
		}
		entityDataList = [EntityDataList]()
		if let entityDataListArray = dictionary["entityDataList"]{
			for dic in entityDataListArray as! Array<Dictionary<String,Any>>{
				let value = EntityDataList(fromDictionary: dic )
				entityDataList.append(value)
			}
		}
		partyId = dictionary["partyId"] as? String
	}

	/**
	 * Returns all the available property values in the form of Dictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> Dictionary<String, Any>
	{
		var dictionary = Dictionary<String, Any>()
		if contactSummaryList != nil{
			var dictionaryElements = [Dictionary<String, Any>]()
			for contactSummaryListElement in contactSummaryList {
				dictionaryElements.append(contactSummaryListElement.toDictionary())
			}
			dictionary["contactSummaryList"] = dictionaryElements
		}
		if contactsList != nil{
			var dictionaryElements = [Dictionary<String, Any>]()
			for contactsListElement in contactsList {
				dictionaryElements.append(contactsListElement.toDictionary() as! Dictionary<String, Any>)
            }
			dictionary["contactsList"] = dictionaryElements
		}
		if entityDataList != nil{
			var dictionaryElements = [Dictionary<String, Any>]()
			for entityDataListElement in entityDataList {
				dictionaryElements.append(entityDataListElement.toDictionary())
			}
			dictionary["entityDataList"] = dictionaryElements
		}
		if partyId != nil{
			dictionary["partyId"] = partyId
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         contactSummaryList = aDecoder.decodeObject(forKey :"contactSummaryList") as? [ContactSummaryList]
         contactsList = aDecoder.decodeObject(forKey :"contactsList") as? [ContactsList]
         entityDataList = aDecoder.decodeObject(forKey :"entityDataList") as? [EntityDataList]
         partyId = aDecoder.decodeObject(forKey: "partyId") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if contactSummaryList != nil{
			aCoder.encode(contactSummaryList, forKey: "contactSummaryList")
		}
		if contactsList != nil{
			aCoder.encode(contactsList, forKey: "contactsList")
		}
		if entityDataList != nil{
			aCoder.encode(entityDataList, forKey: "entityDataList")
		}
		if partyId != nil{
			aCoder.encode(partyId, forKey: "partyId")
		}

	}

}
