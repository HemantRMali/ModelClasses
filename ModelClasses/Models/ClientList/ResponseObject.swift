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
	init(fromDictionary dictionary: NSDictionary){
		contactSummaryList = [ContactSummaryList]()
		if let contactSummaryListArray = dictionary["contactSummaryList"] as? [NSDictionary]{
			for dic in contactSummaryListArray{
				let value = ContactSummaryList(fromDictionary: dic)
				contactSummaryList.append(value)
			}
		}
		contactsList = [ContactsList]()
		if let contactsListArray = dictionary["contactsList"] as? [NSDictionary]{
			for dic in contactsListArray{
				let value = ContactsList(fromDictionary: dic)
				contactsList.append(value)
			}
		}
		entityDataList = [EntityDataList]()
		if let entityDataListArray = dictionary["entityDataList"] as? [NSDictionary]{
			for dic in entityDataListArray{
				let value = EntityDataList(fromDictionary: dic)
				entityDataList.append(value)
			}
		}
		partyId = dictionary["partyId"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if contactSummaryList != nil{
			var dictionaryElements = [NSDictionary]()
			for contactSummaryListElement in contactSummaryList {
				dictionaryElements.append(contactSummaryListElement.toDictionary())
			}
			dictionary["contactSummaryList"] = dictionaryElements
		}
		if contactsList != nil{
			var dictionaryElements = [NSDictionary]()
			for contactsListElement in contactsList {
				dictionaryElements.append(contactsListElement.toDictionary())
			}
			dictionary["contactsList"] = dictionaryElements
		}
		if entityDataList != nil{
			var dictionaryElements = [NSDictionary]()
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