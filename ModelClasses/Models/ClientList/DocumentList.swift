//
//	DocumentList.swift
//
//	Create by Hemant on 3/2/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class DocumentList : NSObject, NSCoding{

	var documentName : String!
	var documentStatus : String!
	var fileName : String!
	var fileStoragePathURI : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		documentName = dictionary["documentName"] as? String
		documentStatus = dictionary["documentStatus"] as? String
		fileName = dictionary["fileName"] as? String
		fileStoragePathURI = dictionary["fileStoragePathURI"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if documentName != nil{
			dictionary["documentName"] = documentName
		}
		if documentStatus != nil{
			dictionary["documentStatus"] = documentStatus
		}
		if fileName != nil{
			dictionary["fileName"] = fileName
		}
		if fileStoragePathURI != nil{
			dictionary["fileStoragePathURI"] = fileStoragePathURI
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         documentName = aDecoder.decodeObject(forKey: "documentName") as? String
         documentStatus = aDecoder.decodeObject(forKey: "documentStatus") as? String
         fileName = aDecoder.decodeObject(forKey: "fileName") as? String
         fileStoragePathURI = aDecoder.decodeObject(forKey: "fileStoragePathURI") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if documentName != nil{
			aCoder.encode(documentName, forKey: "documentName")
		}
		if documentStatus != nil{
			aCoder.encode(documentStatus, forKey: "documentStatus")
		}
		if fileName != nil{
			aCoder.encode(fileName, forKey: "fileName")
		}
		if fileStoragePathURI != nil{
			aCoder.encode(fileStoragePathURI, forKey: "fileStoragePathURI")
		}

	}

}