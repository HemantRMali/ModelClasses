//
//	ContactsList.swift
//
//	Create by Hemant on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ContactsList : NSObject, NSCoding{

	var accountOpen : Int!
	var accountOpenDate : String!
	var accountOpeningFlag : String!
	var accountOpeningSource : String!
	var accountPoolAmount : String!
	var accountStatus : String!
	var address1 : String!
	var address2 : String!
	var address3 : String!
	var arccNo : String!
	var city : String!
	var communicationMobileNo : String!
	var countryCodeId : String!
	var countryName : String!
	var dateSubmitted : String!
	var dealerNo : String!
	var debtPercentage : String!
	var dematNo : String!
	var dob : String!
	var documentList : [DocumentList]!
	var email : String!
	var equityPercentage : String!
	var executedDateTime : String!
	var fatherOrSpouseName : String!
	var firstName : String!
	var groupCode : String!
	var humor : String!
	var imageFilePath : String!
	var language : String!
	var lastModifiedBy : String!
	var lastModifiedDateTime : String!
	var lastName : String!
	var lastlogindate : String!
	var leadSource : String!
	var location : String!
	var mobileNo : String!
	var motherFirstName : String!
	var motherLastName : String!
	var motherMiddleName : String!
	var motherSolutaion : String!
	var nomineeList : [NomineeList]!
	var notifyHistoryFlag : Int!
	var notifyQueueFlag : Int!
	var panNo : String!
	var partyId : String!
	var paymentCleared : Int!
	var pinCode : String!
	var recordTypeId : String!
	var referredByName : String!
	var referredByPartyId : String!
	var rejectedDateTime : String!
	var rejectedReason : String!
	var rmEmail : String!
	var rmMobile : String!
	var rmName : String!
	var rmNo : String!
	var rmPartyId : String!
	var source : String!
	var stage : String!
	var stageId : String!
	var stateName : String!
	var status : String!
	var submittedBy : String!
	var tradingNo : String!
	var uccNo : String!
	var worksiteSessionId : String!
	var worksiteTitle : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: Dictionary<String, Any>){
		accountOpen = dictionary["accountOpen"] as? Int
		accountOpenDate = dictionary["accountOpenDate"] as? String
		accountOpeningFlag = dictionary["accountOpeningFlag"] as? String
		accountOpeningSource = dictionary["accountOpeningSource"] as? String
		accountPoolAmount = dictionary["accountPoolAmount"] as? String
		accountStatus = dictionary["accountStatus"] as? String
		address1 = dictionary["address1"] as? String
		address2 = dictionary["address2"] as? String
		address3 = dictionary["address3"] as? String
		arccNo = dictionary["arccNo"] as? String
		city = dictionary["city"] as? String
		communicationMobileNo = dictionary["communicationMobileNo"] as? String
		countryCodeId = dictionary["countryCodeId"] as? String
		countryName = dictionary["countryName"] as? String
		dateSubmitted = dictionary["dateSubmitted"] as? String
		dealerNo = dictionary["dealerNo"] as? String
		debtPercentage = dictionary["debtPercentage"] as? String
		dematNo = dictionary["dematNo"] as? String
		dob = dictionary["dob"] as? String
		documentList = [DocumentList]()
		if case let documentListArray as Array<Any> = dictionary["documentList"]{
			for dic in documentListArray{
				let value = DocumentList(fromDictionary: dic as! Dictionary<String, Any>)
				documentList.append(value)
			}
		}
		email = dictionary["email"] as? String
		equityPercentage = dictionary["equityPercentage"] as? String
		executedDateTime = dictionary["executedDateTime"] as? String
		fatherOrSpouseName = dictionary["fatherOrSpouseName"] as? String
		firstName = dictionary["firstName"] as? String
		groupCode = dictionary["groupCode"] as? String
		humor = dictionary["humor"] as? String
		imageFilePath = dictionary["imageFilePath"] as? String
		language = dictionary["language"] as? String
		lastModifiedBy = dictionary["lastModifiedBy"] as? String
		lastModifiedDateTime = dictionary["lastModifiedDateTime"] as? String
		lastName = dictionary["lastName"] as? String
		lastlogindate = dictionary["lastlogindate"] as? String
		leadSource = dictionary["leadSource"] as? String
		location = dictionary["location"] as? String
		mobileNo = dictionary["mobileNo"] as? String
		motherFirstName = dictionary["motherFirstName"] as? String
		motherLastName = dictionary["motherLastName"] as? String
		motherMiddleName = dictionary["motherMiddleName"] as? String
		motherSolutaion = dictionary["motherSolutaion"] as? String
		nomineeList = [NomineeList]()
        if let nomineeListArray : Array<Any> = dictionary["nomineeList"] as! Array<Any>?{
			for dic in nomineeListArray{
				let value = NomineeList(fromDictionary: dic as! Dictionary<String, Any>)
				nomineeList.append(value)
			}
		}
		notifyHistoryFlag = dictionary["notifyHistoryFlag"] as? Int
		notifyQueueFlag = dictionary["notifyQueueFlag"] as? Int
		panNo = dictionary["panNo"] as? String
		partyId = dictionary["partyId"] as? String
		paymentCleared = dictionary["paymentCleared"] as? Int
		pinCode = dictionary["pinCode"] as? String
		recordTypeId = dictionary["recordTypeId"] as? String
		referredByName = dictionary["referredByName"] as? String
		referredByPartyId = dictionary["referredByPartyId"] as? String
		rejectedDateTime = dictionary["rejectedDateTime"] as? String
		rejectedReason = dictionary["rejectedReason"] as? String
		rmEmail = dictionary["rmEmail"] as? String
		rmMobile = dictionary["rmMobile"] as? String
		rmName = dictionary["rmName"] as? String
		rmNo = dictionary["rmNo"] as? String
		rmPartyId = dictionary["rmPartyId"] as? String
		source = dictionary["source"] as? String
		stage = dictionary["stage"] as? String
		stageId = dictionary["stageId"] as? String
		stateName = dictionary["stateName"] as? String
		status = dictionary["status"] as? String
		submittedBy = dictionary["submittedBy"] as? String
		tradingNo = dictionary["tradingNo"] as? String
		uccNo = dictionary["uccNo"] as? String
		worksiteSessionId = dictionary["worksiteSessionId"] as? String
		worksiteTitle = dictionary["worksiteTitle"] as? String
	}

	/**
	 * Returns all the available property values in the form of Dictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> Dictionary<String, Any>
	{
        var dictionary : Dictionary = Dictionary<String,Any>()
		if accountOpen != nil{
			dictionary["accountOpen"] = accountOpen
		}
		if accountOpenDate != nil{
			dictionary["accountOpenDate"] = accountOpenDate
		}
		if accountOpeningFlag != nil{
			dictionary["accountOpeningFlag"] = accountOpeningFlag
		}
		if accountOpeningSource != nil{
			dictionary["accountOpeningSource"] = accountOpeningSource
		}
		if accountPoolAmount != nil{
			dictionary["accountPoolAmount"] = accountPoolAmount
		}
		if accountStatus != nil{
			dictionary["accountStatus"] = accountStatus
		}
		if address1 != nil{
			dictionary["address1"] = address1
		}
		if address2 != nil{
			dictionary["address2"] = address2
		}
		if address3 != nil{
			dictionary["address3"] = address3
		}
		if arccNo != nil{
			dictionary["arccNo"] = arccNo
		}
		if city != nil{
			dictionary["city"] = city
		}
		if communicationMobileNo != nil{
			dictionary["communicationMobileNo"] = communicationMobileNo
		}
		if countryCodeId != nil{
			dictionary["countryCodeId"] = countryCodeId
		}
		if countryName != nil{
			dictionary["countryName"] = countryName
		}
		if dateSubmitted != nil{
			dictionary["dateSubmitted"] = dateSubmitted
		}
		if dealerNo != nil{
			dictionary["dealerNo"] = dealerNo
		}
		if debtPercentage != nil{
			dictionary["debtPercentage"] = debtPercentage
		}
		if dematNo != nil{
			dictionary["dematNo"] = dematNo
		}
		if dob != nil{
			dictionary["dob"] = dob
		}
		if documentList != nil{
			var dictionaryElements = [Dictionary<String, Any>]()
			for documentListElement in documentList {
				dictionaryElements.append(documentListElement.toDictionary() as Dictionary)
			}
			dictionary["documentList"] = dictionaryElements
		}
		if email != nil{
			dictionary["email"] = email
		}
		if equityPercentage != nil{
			dictionary["equityPercentage"] = equityPercentage
		}
		if executedDateTime != nil{
			dictionary["executedDateTime"] = executedDateTime
		}
		if fatherOrSpouseName != nil{
			dictionary["fatherOrSpouseName"] = fatherOrSpouseName
		}
		if firstName != nil{
			dictionary["firstName"] = firstName
		}
		if groupCode != nil{
			dictionary["groupCode"] = groupCode
		}
		if humor != nil{
			dictionary["humor"] = humor
		}
		if imageFilePath != nil{
			dictionary["imageFilePath"] = imageFilePath
		}
		if language != nil{
			dictionary["language"] = language
		}
		if lastModifiedBy != nil{
			dictionary["lastModifiedBy"] = lastModifiedBy
		}
		if lastModifiedDateTime != nil{
			dictionary["lastModifiedDateTime"] = lastModifiedDateTime
		}
		if lastName != nil{
			dictionary["lastName"] = lastName
		}
		if lastlogindate != nil{
			dictionary["lastlogindate"] = lastlogindate
		}
		if leadSource != nil{
			dictionary["leadSource"] = leadSource
		}
		if location != nil{
			dictionary["location"] = location
		}
		if mobileNo != nil{
			dictionary["mobileNo"] = mobileNo
		}
		if motherFirstName != nil{
			dictionary["motherFirstName"] = motherFirstName
		}
		if motherLastName != nil{
			dictionary["motherLastName"] = motherLastName
		}
		if motherMiddleName != nil{
			dictionary["motherMiddleName"] = motherMiddleName
		}
		if motherSolutaion != nil{
			dictionary["motherSolutaion"] = motherSolutaion
		}
		if nomineeList != nil{
			var dictionaryElements = [Dictionary<String, Any>]()
			for nomineeListElement in nomineeList {
				dictionaryElements.append(nomineeListElement.toDictionary() as Dictionary)
			}
			dictionary["nomineeList"] = dictionaryElements
		}
		if notifyHistoryFlag != nil{
			dictionary["notifyHistoryFlag"] = notifyHistoryFlag
		}
		if notifyQueueFlag != nil{
			dictionary["notifyQueueFlag"] = notifyQueueFlag
		}
		if panNo != nil{
			dictionary["panNo"] = panNo
		}
		if partyId != nil{
			dictionary["partyId"] = partyId
		}
		if paymentCleared != nil{
			dictionary["paymentCleared"] = paymentCleared
		}
		if pinCode != nil{
			dictionary["pinCode"] = pinCode
		}
		if recordTypeId != nil{
			dictionary["recordTypeId"] = recordTypeId
		}
		if referredByName != nil{
			dictionary["referredByName"] = referredByName
		}
		if referredByPartyId != nil{
			dictionary["referredByPartyId"] = referredByPartyId
		}
		if rejectedDateTime != nil{
			dictionary["rejectedDateTime"] = rejectedDateTime
		}
		if rejectedReason != nil{
			dictionary["rejectedReason"] = rejectedReason
		}
		if rmEmail != nil{
			dictionary["rmEmail"] = rmEmail
		}
		if rmMobile != nil{
			dictionary["rmMobile"] = rmMobile
		}
		if rmName != nil{
			dictionary["rmName"] = rmName
		}
		if rmNo != nil{
			dictionary["rmNo"] = rmNo
		}
		if rmPartyId != nil{
			dictionary["rmPartyId"] = rmPartyId
		}
		if source != nil{
			dictionary["source"] = source
		}
		if stage != nil{
			dictionary["stage"] = stage
		}
		if stageId != nil{
			dictionary["stageId"] = stageId
		}
		if stateName != nil{
			dictionary["stateName"] = stateName
		}
		if status != nil{
			dictionary["status"] = status
		}
		if submittedBy != nil{
			dictionary["submittedBy"] = submittedBy
		}
		if tradingNo != nil{
			dictionary["tradingNo"] = tradingNo
		}
		if uccNo != nil{
			dictionary["uccNo"] = uccNo
		}
		if worksiteSessionId != nil{
			dictionary["worksiteSessionId"] = worksiteSessionId
		}
		if worksiteTitle != nil{
			dictionary["worksiteTitle"] = worksiteTitle
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         accountOpen = aDecoder.decodeObject(forKey: "accountOpen") as? Int
         accountOpenDate = aDecoder.decodeObject(forKey: "accountOpenDate") as? String
         accountOpeningFlag = aDecoder.decodeObject(forKey: "accountOpeningFlag") as? String
         accountOpeningSource = aDecoder.decodeObject(forKey: "accountOpeningSource") as? String
         accountPoolAmount = aDecoder.decodeObject(forKey: "accountPoolAmount") as? String
         accountStatus = aDecoder.decodeObject(forKey: "accountStatus") as? String
         address1 = aDecoder.decodeObject(forKey: "address1") as? String
         address2 = aDecoder.decodeObject(forKey: "address2") as? String
         address3 = aDecoder.decodeObject(forKey: "address3") as? String
         arccNo = aDecoder.decodeObject(forKey: "arccNo") as? String
         city = aDecoder.decodeObject(forKey: "city") as? String
         communicationMobileNo = aDecoder.decodeObject(forKey: "communicationMobileNo") as? String
         countryCodeId = aDecoder.decodeObject(forKey: "countryCodeId") as? String
         countryName = aDecoder.decodeObject(forKey: "countryName") as? String
         dateSubmitted = aDecoder.decodeObject(forKey: "dateSubmitted") as? String
         dealerNo = aDecoder.decodeObject(forKey: "dealerNo") as? String
         debtPercentage = aDecoder.decodeObject(forKey: "debtPercentage") as? String
         dematNo = aDecoder.decodeObject(forKey: "dematNo") as? String
         dob = aDecoder.decodeObject(forKey: "dob") as? String
         documentList = aDecoder.decodeObject(forKey :"documentList") as? [DocumentList]
         email = aDecoder.decodeObject(forKey: "email") as? String
         equityPercentage = aDecoder.decodeObject(forKey: "equityPercentage") as? String
         executedDateTime = aDecoder.decodeObject(forKey: "executedDateTime") as? String
         fatherOrSpouseName = aDecoder.decodeObject(forKey: "fatherOrSpouseName") as? String
         firstName = aDecoder.decodeObject(forKey: "firstName") as? String
         groupCode = aDecoder.decodeObject(forKey: "groupCode") as? String
         humor = aDecoder.decodeObject(forKey: "humor") as? String
         imageFilePath = aDecoder.decodeObject(forKey: "imageFilePath") as? String
         language = aDecoder.decodeObject(forKey: "language") as? String
         lastModifiedBy = aDecoder.decodeObject(forKey: "lastModifiedBy") as? String
         lastModifiedDateTime = aDecoder.decodeObject(forKey: "lastModifiedDateTime") as? String
         lastName = aDecoder.decodeObject(forKey: "lastName") as? String
         lastlogindate = aDecoder.decodeObject(forKey: "lastlogindate") as? String
         leadSource = aDecoder.decodeObject(forKey: "leadSource") as? String
         location = aDecoder.decodeObject(forKey: "location") as? String
         mobileNo = aDecoder.decodeObject(forKey: "mobileNo") as? String
         motherFirstName = aDecoder.decodeObject(forKey: "motherFirstName") as? String
         motherLastName = aDecoder.decodeObject(forKey: "motherLastName") as? String
         motherMiddleName = aDecoder.decodeObject(forKey: "motherMiddleName") as? String
         motherSolutaion = aDecoder.decodeObject(forKey: "motherSolutaion") as? String
         nomineeList = aDecoder.decodeObject(forKey :"nomineeList") as? [NomineeList]
         notifyHistoryFlag = aDecoder.decodeObject(forKey: "notifyHistoryFlag") as? Int
         notifyQueueFlag = aDecoder.decodeObject(forKey: "notifyQueueFlag") as? Int
         panNo = aDecoder.decodeObject(forKey: "panNo") as? String
         partyId = aDecoder.decodeObject(forKey: "partyId") as? String
         paymentCleared = aDecoder.decodeObject(forKey: "paymentCleared") as? Int
         pinCode = aDecoder.decodeObject(forKey: "pinCode") as? String
         recordTypeId = aDecoder.decodeObject(forKey: "recordTypeId") as? String
         referredByName = aDecoder.decodeObject(forKey: "referredByName") as? String
         referredByPartyId = aDecoder.decodeObject(forKey: "referredByPartyId") as? String
         rejectedDateTime = aDecoder.decodeObject(forKey: "rejectedDateTime") as? String
         rejectedReason = aDecoder.decodeObject(forKey: "rejectedReason") as? String
         rmEmail = aDecoder.decodeObject(forKey: "rmEmail") as? String
         rmMobile = aDecoder.decodeObject(forKey: "rmMobile") as? String
         rmName = aDecoder.decodeObject(forKey: "rmName") as? String
         rmNo = aDecoder.decodeObject(forKey: "rmNo") as? String
         rmPartyId = aDecoder.decodeObject(forKey: "rmPartyId") as? String
         source = aDecoder.decodeObject(forKey: "source") as? String
         stage = aDecoder.decodeObject(forKey: "stage") as? String
         stageId = aDecoder.decodeObject(forKey: "stageId") as? String
         stateName = aDecoder.decodeObject(forKey: "stateName") as? String
         status = aDecoder.decodeObject(forKey: "status") as? String
         submittedBy = aDecoder.decodeObject(forKey: "submittedBy") as? String
         tradingNo = aDecoder.decodeObject(forKey: "tradingNo") as? String
         uccNo = aDecoder.decodeObject(forKey: "uccNo") as? String
         worksiteSessionId = aDecoder.decodeObject(forKey: "worksiteSessionId") as? String
         worksiteTitle = aDecoder.decodeObject(forKey: "worksiteTitle") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if accountOpen != nil{
			aCoder.encode(accountOpen, forKey: "accountOpen")
		}
		if accountOpenDate != nil{
			aCoder.encode(accountOpenDate, forKey: "accountOpenDate")
		}
		if accountOpeningFlag != nil{
			aCoder.encode(accountOpeningFlag, forKey: "accountOpeningFlag")
		}
		if accountOpeningSource != nil{
			aCoder.encode(accountOpeningSource, forKey: "accountOpeningSource")
		}
		if accountPoolAmount != nil{
			aCoder.encode(accountPoolAmount, forKey: "accountPoolAmount")
		}
		if accountStatus != nil{
			aCoder.encode(accountStatus, forKey: "accountStatus")
		}
		if address1 != nil{
			aCoder.encode(address1, forKey: "address1")
		}
		if address2 != nil{
			aCoder.encode(address2, forKey: "address2")
		}
		if address3 != nil{
			aCoder.encode(address3, forKey: "address3")
		}
		if arccNo != nil{
			aCoder.encode(arccNo, forKey: "arccNo")
		}
		if city != nil{
			aCoder.encode(city, forKey: "city")
		}
		if communicationMobileNo != nil{
			aCoder.encode(communicationMobileNo, forKey: "communicationMobileNo")
		}
		if countryCodeId != nil{
			aCoder.encode(countryCodeId, forKey: "countryCodeId")
		}
		if countryName != nil{
			aCoder.encode(countryName, forKey: "countryName")
		}
		if dateSubmitted != nil{
			aCoder.encode(dateSubmitted, forKey: "dateSubmitted")
		}
		if dealerNo != nil{
			aCoder.encode(dealerNo, forKey: "dealerNo")
		}
		if debtPercentage != nil{
			aCoder.encode(debtPercentage, forKey: "debtPercentage")
		}
		if dematNo != nil{
			aCoder.encode(dematNo, forKey: "dematNo")
		}
		if dob != nil{
			aCoder.encode(dob, forKey: "dob")
		}
		if documentList != nil{
			aCoder.encode(documentList, forKey: "documentList")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if equityPercentage != nil{
			aCoder.encode(equityPercentage, forKey: "equityPercentage")
		}
		if executedDateTime != nil{
			aCoder.encode(executedDateTime, forKey: "executedDateTime")
		}
		if fatherOrSpouseName != nil{
			aCoder.encode(fatherOrSpouseName, forKey: "fatherOrSpouseName")
		}
		if firstName != nil{
			aCoder.encode(firstName, forKey: "firstName")
		}
		if groupCode != nil{
			aCoder.encode(groupCode, forKey: "groupCode")
		}
		if humor != nil{
			aCoder.encode(humor, forKey: "humor")
		}
		if imageFilePath != nil{
			aCoder.encode(imageFilePath, forKey: "imageFilePath")
		}
		if language != nil{
			aCoder.encode(language, forKey: "language")
		}
		if lastModifiedBy != nil{
			aCoder.encode(lastModifiedBy, forKey: "lastModifiedBy")
		}
		if lastModifiedDateTime != nil{
			aCoder.encode(lastModifiedDateTime, forKey: "lastModifiedDateTime")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "lastName")
		}
		if lastlogindate != nil{
			aCoder.encode(lastlogindate, forKey: "lastlogindate")
		}
		if leadSource != nil{
			aCoder.encode(leadSource, forKey: "leadSource")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if mobileNo != nil{
			aCoder.encode(mobileNo, forKey: "mobileNo")
		}
		if motherFirstName != nil{
			aCoder.encode(motherFirstName, forKey: "motherFirstName")
		}
		if motherLastName != nil{
			aCoder.encode(motherLastName, forKey: "motherLastName")
		}
		if motherMiddleName != nil{
			aCoder.encode(motherMiddleName, forKey: "motherMiddleName")
		}
		if motherSolutaion != nil{
			aCoder.encode(motherSolutaion, forKey: "motherSolutaion")
		}
		if nomineeList != nil{
			aCoder.encode(nomineeList, forKey: "nomineeList")
		}
		if notifyHistoryFlag != nil{
			aCoder.encode(notifyHistoryFlag, forKey: "notifyHistoryFlag")
		}
		if notifyQueueFlag != nil{
			aCoder.encode(notifyQueueFlag, forKey: "notifyQueueFlag")
		}
		if panNo != nil{
			aCoder.encode(panNo, forKey: "panNo")
		}
		if partyId != nil{
			aCoder.encode(partyId, forKey: "partyId")
		}
		if paymentCleared != nil{
			aCoder.encode(paymentCleared, forKey: "paymentCleared")
		}
		if pinCode != nil{
			aCoder.encode(pinCode, forKey: "pinCode")
		}
		if recordTypeId != nil{
			aCoder.encode(recordTypeId, forKey: "recordTypeId")
		}
		if referredByName != nil{
			aCoder.encode(referredByName, forKey: "referredByName")
		}
		if referredByPartyId != nil{
			aCoder.encode(referredByPartyId, forKey: "referredByPartyId")
		}
		if rejectedDateTime != nil{
			aCoder.encode(rejectedDateTime, forKey: "rejectedDateTime")
		}
		if rejectedReason != nil{
			aCoder.encode(rejectedReason, forKey: "rejectedReason")
		}
		if rmEmail != nil{
			aCoder.encode(rmEmail, forKey: "rmEmail")
		}
		if rmMobile != nil{
			aCoder.encode(rmMobile, forKey: "rmMobile")
		}
		if rmName != nil{
			aCoder.encode(rmName, forKey: "rmName")
		}
		if rmNo != nil{
			aCoder.encode(rmNo, forKey: "rmNo")
		}
		if rmPartyId != nil{
			aCoder.encode(rmPartyId, forKey: "rmPartyId")
		}
		if source != nil{
			aCoder.encode(source, forKey: "source")
		}
		if stage != nil{
			aCoder.encode(stage, forKey: "stage")
		}
		if stageId != nil{
			aCoder.encode(stageId, forKey: "stageId")
		}
		if stateName != nil{
			aCoder.encode(stateName, forKey: "stateName")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if submittedBy != nil{
			aCoder.encode(submittedBy, forKey: "submittedBy")
		}
		if tradingNo != nil{
			aCoder.encode(tradingNo, forKey: "tradingNo")
		}
		if uccNo != nil{
			aCoder.encode(uccNo, forKey: "uccNo")
		}
		if worksiteSessionId != nil{
			aCoder.encode(worksiteSessionId, forKey: "worksiteSessionId")
		}
		if worksiteTitle != nil{
			aCoder.encode(worksiteTitle, forKey: "worksiteTitle")
		}

	}

}
