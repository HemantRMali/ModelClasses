//
//	NomineeList.swift
//
//	Create by Hemant on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class NomineeList : NSObject, NSCoding{

	var guardianAddressLine1 : String!
	var guardianAddressLine2 : String!
	var guardianAddressLine3 : String!
	var guardianCity : String!
	var guardianCountry : String!
	var guardianName : String!
	var guardianPhone : String!
	var guardianPincode : String!
	var guardianState : String!
	var nomineeAddressLine1 : String!
	var nomineeAddressLine2 : String!
	var nomineeAddressLine3 : String!
	var nomineeCity : String!
	var nomineeCountry : String!
	var nomineeDob : String!
	var nomineeDocumentFilepath : String!
	var nomineeDocumentId : String!
	var nomineeEmailId : String!
	var nomineeFax : String!
	var nomineeName : String!
	var nomineePAN : String!
	var nomineePhone : String!
	var nomineePincode : String!
	var nomineeRelation : String!
	var nomineeSolutaion : String!
	var nomineeState : String!
	var nomineeWitness1Name : String!
	var nomineeWitness2Name : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: Dictionary<String, Any>){
		guardianAddressLine1 = dictionary["guardianAddressLine1"] as? String
		guardianAddressLine2 = dictionary["guardianAddressLine2"] as? String
		guardianAddressLine3 = dictionary["guardianAddressLine3"] as? String
		guardianCity = dictionary["guardianCity"] as? String
		guardianCountry = dictionary["guardianCountry"] as? String
		guardianName = dictionary["guardianName"] as? String
		guardianPhone = dictionary["guardianPhone"] as? String
		guardianPincode = dictionary["guardianPincode"] as? String
		guardianState = dictionary["guardianState"] as? String
		nomineeAddressLine1 = dictionary["nomineeAddressLine1"] as? String
		nomineeAddressLine2 = dictionary["nomineeAddressLine2"] as? String
		nomineeAddressLine3 = dictionary["nomineeAddressLine3"] as? String
		nomineeCity = dictionary["nomineeCity"] as? String
		nomineeCountry = dictionary["nomineeCountry"] as? String
		nomineeDob = dictionary["nomineeDob"] as? String
		nomineeDocumentFilepath = dictionary["nomineeDocumentFilepath"] as? String
		nomineeDocumentId = dictionary["nomineeDocumentId"] as? String
		nomineeEmailId = dictionary["nomineeEmailId"] as? String
		nomineeFax = dictionary["nomineeFax"] as? String
		nomineeName = dictionary["nomineeName"] as? String
		nomineePAN = dictionary["nomineePAN"] as? String
		nomineePhone = dictionary["nomineePhone"] as? String
		nomineePincode = dictionary["nomineePincode"] as? String
		nomineeRelation = dictionary["nomineeRelation"] as? String
		nomineeSolutaion = dictionary["nomineeSolutaion"] as? String
		nomineeState = dictionary["nomineeState"] as? String
		nomineeWitness1Name = dictionary["nomineeWitness1Name"] as? String
		nomineeWitness2Name = dictionary["nomineeWitness2Name"] as? String
	}

	/**
	 * Returns all the available property values in the form of Dictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> Dictionary<String, Any>
	{
		var dictionary = Dictionary<String, Any>()
		if guardianAddressLine1 != nil{
			dictionary["guardianAddressLine1"] = guardianAddressLine1
		}
		if guardianAddressLine2 != nil{
			dictionary["guardianAddressLine2"] = guardianAddressLine2
		}
		if guardianAddressLine3 != nil{
			dictionary["guardianAddressLine3"] = guardianAddressLine3
		}
		if guardianCity != nil{
			dictionary["guardianCity"] = guardianCity
		}
		if guardianCountry != nil{
			dictionary["guardianCountry"] = guardianCountry
		}
		if guardianName != nil{
			dictionary["guardianName"] = guardianName
		}
		if guardianPhone != nil{
			dictionary["guardianPhone"] = guardianPhone
		}
		if guardianPincode != nil{
			dictionary["guardianPincode"] = guardianPincode
		}
		if guardianState != nil{
			dictionary["guardianState"] = guardianState
		}
		if nomineeAddressLine1 != nil{
			dictionary["nomineeAddressLine1"] = nomineeAddressLine1
		}
		if nomineeAddressLine2 != nil{
			dictionary["nomineeAddressLine2"] = nomineeAddressLine2
		}
		if nomineeAddressLine3 != nil{
			dictionary["nomineeAddressLine3"] = nomineeAddressLine3
		}
		if nomineeCity != nil{
			dictionary["nomineeCity"] = nomineeCity
		}
		if nomineeCountry != nil{
			dictionary["nomineeCountry"] = nomineeCountry
		}
		if nomineeDob != nil{
			dictionary["nomineeDob"] = nomineeDob
		}
		if nomineeDocumentFilepath != nil{
			dictionary["nomineeDocumentFilepath"] = nomineeDocumentFilepath
		}
		if nomineeDocumentId != nil{
			dictionary["nomineeDocumentId"] = nomineeDocumentId
		}
		if nomineeEmailId != nil{
			dictionary["nomineeEmailId"] = nomineeEmailId
		}
		if nomineeFax != nil{
			dictionary["nomineeFax"] = nomineeFax
		}
		if nomineeName != nil{
			dictionary["nomineeName"] = nomineeName
		}
		if nomineePAN != nil{
			dictionary["nomineePAN"] = nomineePAN
		}
		if nomineePhone != nil{
			dictionary["nomineePhone"] = nomineePhone
		}
		if nomineePincode != nil{
			dictionary["nomineePincode"] = nomineePincode
		}
		if nomineeRelation != nil{
			dictionary["nomineeRelation"] = nomineeRelation
		}
		if nomineeSolutaion != nil{
			dictionary["nomineeSolutaion"] = nomineeSolutaion
		}
		if nomineeState != nil{
			dictionary["nomineeState"] = nomineeState
		}
		if nomineeWitness1Name != nil{
			dictionary["nomineeWitness1Name"] = nomineeWitness1Name
		}
		if nomineeWitness2Name != nil{
			dictionary["nomineeWitness2Name"] = nomineeWitness2Name
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         guardianAddressLine1 = aDecoder.decodeObject(forKey: "guardianAddressLine1") as? String
         guardianAddressLine2 = aDecoder.decodeObject(forKey: "guardianAddressLine2") as? String
         guardianAddressLine3 = aDecoder.decodeObject(forKey: "guardianAddressLine3") as? String
         guardianCity = aDecoder.decodeObject(forKey: "guardianCity") as? String
         guardianCountry = aDecoder.decodeObject(forKey: "guardianCountry") as? String
         guardianName = aDecoder.decodeObject(forKey: "guardianName") as? String
         guardianPhone = aDecoder.decodeObject(forKey: "guardianPhone") as? String
         guardianPincode = aDecoder.decodeObject(forKey: "guardianPincode") as? String
         guardianState = aDecoder.decodeObject(forKey: "guardianState") as? String
         nomineeAddressLine1 = aDecoder.decodeObject(forKey: "nomineeAddressLine1") as? String
         nomineeAddressLine2 = aDecoder.decodeObject(forKey: "nomineeAddressLine2") as? String
         nomineeAddressLine3 = aDecoder.decodeObject(forKey: "nomineeAddressLine3") as? String
         nomineeCity = aDecoder.decodeObject(forKey: "nomineeCity") as? String
         nomineeCountry = aDecoder.decodeObject(forKey: "nomineeCountry") as? String
         nomineeDob = aDecoder.decodeObject(forKey: "nomineeDob") as? String
         nomineeDocumentFilepath = aDecoder.decodeObject(forKey: "nomineeDocumentFilepath") as? String
         nomineeDocumentId = aDecoder.decodeObject(forKey: "nomineeDocumentId") as? String
         nomineeEmailId = aDecoder.decodeObject(forKey: "nomineeEmailId") as? String
         nomineeFax = aDecoder.decodeObject(forKey: "nomineeFax") as? String
         nomineeName = aDecoder.decodeObject(forKey: "nomineeName") as? String
         nomineePAN = aDecoder.decodeObject(forKey: "nomineePAN") as? String
         nomineePhone = aDecoder.decodeObject(forKey: "nomineePhone") as? String
         nomineePincode = aDecoder.decodeObject(forKey: "nomineePincode") as? String
         nomineeRelation = aDecoder.decodeObject(forKey: "nomineeRelation") as? String
         nomineeSolutaion = aDecoder.decodeObject(forKey: "nomineeSolutaion") as? String
         nomineeState = aDecoder.decodeObject(forKey: "nomineeState") as? String
         nomineeWitness1Name = aDecoder.decodeObject(forKey: "nomineeWitness1Name") as? String
         nomineeWitness2Name = aDecoder.decodeObject(forKey: "nomineeWitness2Name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if guardianAddressLine1 != nil{
			aCoder.encode(guardianAddressLine1, forKey: "guardianAddressLine1")
		}
		if guardianAddressLine2 != nil{
			aCoder.encode(guardianAddressLine2, forKey: "guardianAddressLine2")
		}
		if guardianAddressLine3 != nil{
			aCoder.encode(guardianAddressLine3, forKey: "guardianAddressLine3")
		}
		if guardianCity != nil{
			aCoder.encode(guardianCity, forKey: "guardianCity")
		}
		if guardianCountry != nil{
			aCoder.encode(guardianCountry, forKey: "guardianCountry")
		}
		if guardianName != nil{
			aCoder.encode(guardianName, forKey: "guardianName")
		}
		if guardianPhone != nil{
			aCoder.encode(guardianPhone, forKey: "guardianPhone")
		}
		if guardianPincode != nil{
			aCoder.encode(guardianPincode, forKey: "guardianPincode")
		}
		if guardianState != nil{
			aCoder.encode(guardianState, forKey: "guardianState")
		}
		if nomineeAddressLine1 != nil{
			aCoder.encode(nomineeAddressLine1, forKey: "nomineeAddressLine1")
		}
		if nomineeAddressLine2 != nil{
			aCoder.encode(nomineeAddressLine2, forKey: "nomineeAddressLine2")
		}
		if nomineeAddressLine3 != nil{
			aCoder.encode(nomineeAddressLine3, forKey: "nomineeAddressLine3")
		}
		if nomineeCity != nil{
			aCoder.encode(nomineeCity, forKey: "nomineeCity")
		}
		if nomineeCountry != nil{
			aCoder.encode(nomineeCountry, forKey: "nomineeCountry")
		}
		if nomineeDob != nil{
			aCoder.encode(nomineeDob, forKey: "nomineeDob")
		}
		if nomineeDocumentFilepath != nil{
			aCoder.encode(nomineeDocumentFilepath, forKey: "nomineeDocumentFilepath")
		}
		if nomineeDocumentId != nil{
			aCoder.encode(nomineeDocumentId, forKey: "nomineeDocumentId")
		}
		if nomineeEmailId != nil{
			aCoder.encode(nomineeEmailId, forKey: "nomineeEmailId")
		}
		if nomineeFax != nil{
			aCoder.encode(nomineeFax, forKey: "nomineeFax")
		}
		if nomineeName != nil{
			aCoder.encode(nomineeName, forKey: "nomineeName")
		}
		if nomineePAN != nil{
			aCoder.encode(nomineePAN, forKey: "nomineePAN")
		}
		if nomineePhone != nil{
			aCoder.encode(nomineePhone, forKey: "nomineePhone")
		}
		if nomineePincode != nil{
			aCoder.encode(nomineePincode, forKey: "nomineePincode")
		}
		if nomineeRelation != nil{
			aCoder.encode(nomineeRelation, forKey: "nomineeRelation")
		}
		if nomineeSolutaion != nil{
			aCoder.encode(nomineeSolutaion, forKey: "nomineeSolutaion")
		}
		if nomineeState != nil{
			aCoder.encode(nomineeState, forKey: "nomineeState")
		}
		if nomineeWitness1Name != nil{
			aCoder.encode(nomineeWitness1Name, forKey: "nomineeWitness1Name")
		}
		if nomineeWitness2Name != nil{
			aCoder.encode(nomineeWitness2Name, forKey: "nomineeWitness2Name")
		}

	}

}
