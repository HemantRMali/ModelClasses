//
//  WebService.swift
//  NSUSRL_SESSION_SWIFT
//
//  Created by Hemant on 09/06/16.
//  Copyright © 2016 Hemant. All rights reserved.
//

import UIKit
import Foundation
import SwiftyJSON
@objc protocol WebServiceDelegate{
    
}

class WebService: NSObject,URLSessionDelegate,URLSessionDataDelegate {
    
   
   
    var delegate          :WebServiceDelegate!
    var receivedData = NSMutableData()
    
    //MARK:- ASYNCHRONOUS_REQUEST
    /// This function is use to call Asynchronous Request.
    ///
    /// - Parameters:
    ///   - parameters       : parameters description.
    ///   - forWebServiceCall: webservice url.
    ///   - setHTTPMethod    : http method for NSMutableURLRequest.
    ///   - successBlock     : This block will success or failure response.
    func asynchronousRequestCallMethod(parameters: NSDictionary, forWebServiceCall: String, setHTTPMethod: String, successBlock:@escaping (_ responseData:AnyObject,_ isSuccess:Bool)->Void) {

        
        let url: NSURL = NSURL(string: forWebServiceCall)!
        let request = NSMutableURLRequest(url: url as URL)
        request .addValue("bFcwUEJUN0lhekVkREVZTzduVHQ=", forHTTPHeaderField: "Api-Key")
        request.httpBody = ConvertDictionaryToJsonString(object: parameters)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            // Get responce
            var json = [String : AnyObject]()
            do {
                json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as! [String : AnyObject]
                successBlock(json as AnyObject, true)
            } catch {
                successBlock(json as AnyObject,false)
                print(error)
                print("error : catch block execute")
            }
        }
        task.resume()
    }
    
    //MARK:- WEBSERVICE_CALL_METHOD
    
    /// This function is use to call POST method API.
    ///
    /// - Parameters:
    ///   - parameters       : Request parameter dictionary
    ///   - forWebServiceCall: webservice url.
    ///   - setHTTPMethod    : http method for NSMutableURLRequest.
    ///   - successBlock     : This block will success or failure response.
    func webServiceCallMethod(parameters: NSDictionary, forWebServiceCall: String, setHTTPMethod: String,successBlock:@escaping (_ responseData : AnyObject,_ isSuccess : Bool)->Void) {
        
        let session = URLSession(configuration:URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue .main)
        let urlRequest = createRequest(parameter: parameters, strURL: forWebServiceCall as NSString)
        
        if (try? JSONSerialization.data(withJSONObject: parameters, options: [])) != nil {
        
            //1) Custom delegate
            //2) system provided delegate
            let task = session.dataTask(with: urlRequest as URLRequest) { data, response, error in
                // Get responce
                var json = [String : AnyObject]()
                
                guard (data != nil) || response != nil else{
                    return successBlock(json as AnyObject,false)
                }
                
                do {
                    json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String : AnyObject]
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Status code: (\(httpResponse.statusCode))")
                        
                        if httpResponse.statusCode == NSURLErrorTimedOut{
                            print("request time out")
                        }else{
                            successBlock(json as AnyObject, true)
                        }
                        // do stuff.
                    }
                    
                } catch {
                    successBlock(json as AnyObject,false)
                    print(error)
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Status code: (\(httpResponse.statusCode))")
                        
                        if httpResponse.statusCode == NSURLErrorTimedOut{
                            print("request time out")
                        }else{
                            successBlock(json as AnyObject, true)
                        }
                        // do stuff.
                    }
                    print("error : catch block execute")
                }
            }
            task.resume()
        }
  
    }
    
    //MARK:- WEBSERVICE_CALL_METHOD
    /// This function is use to call GET method API.
    ///
    /// - Parameters:
    ///   - parameters       : Request parameter dictionary
    ///   - forWebServiceCall: webservice url.
    ///   - setHTTPMethod    : It should be GET httpMethod
    ///   - successBlock     : This block will success or failure response.
    func webServiceGetMethod(forWebServiceCall: String, setHTTPMethod: String,successBlock:@escaping (_ responseData : AnyObject,_ isSuccess : Bool)->Void) {
        
        let session = URLSession(configuration:URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue .main)
        
        let url = URL(string: forWebServiceCall)
        let urlRequest = URLRequest(url: url!)
        
          //1) Custom delegate
          //2) system provided delegate
            let task = session.dataTask(with: urlRequest as URLRequest) { data, response, error in
                // Get responce
                var json = [String : AnyObject]()
                guard (data != nil) || response != nil else{
                    return successBlock(json as AnyObject,false)
                }

                do {
                    json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String : AnyObject]
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Status code: (\(httpResponse.statusCode))")
                        
                        if httpResponse.statusCode == NSURLErrorTimedOut{
                            print("request time out")
                        }else{
                            successBlock(json as AnyObject, true)
                        }
                        // do stuff.
                    }
                    
                } catch {
                    successBlock(json as AnyObject,false)
                    print(error)
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Status code: (\(httpResponse.statusCode))")
                        
                        if httpResponse.statusCode == NSURLErrorTimedOut{
                            print("request time out")
                        }else{
                            successBlock(json as AnyObject, true)
                        }
                        // do stuff.
                    }
                    print("error : catch block execute")
                }
            }
            task.resume()
    }
    
    
    /// This is seperate function for createRequest.
    ///
    /// - Parameters:
    ///   - parameter: Request Parameters.
    ///   - strURL: API url.
    /// - Returns: This will returns NSURLRequest with all required parameter set.
    func createRequest (parameter: NSDictionary,strURL:NSString) -> NSURLRequest {
        
        let TOKEN : String! = USER_DEFAULTS.value(forKey: "Token") as! String!
        var request = NSMutableURLRequest()
        if TOKEN != nil{
            let url = URL(string: strURL as String)!
            request = NSMutableURLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue(TOKEN, forHTTPHeaderField: "Token")
            request.setValue("31010",forHTTPHeaderField: "sourceSystemId")
            request.setValue("27808",forHTTPHeaderField: "buId")
            request.setValue(MAC_UUID,forHTTPHeaderField: "macId")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = ConvertDictionaryToJsonString(object: parameter)
        }
        return request
    }
    
    
    /// This function is use to convert dictionary to JSONString.
    ///
    /// - Parameter object: Disctionary.
    /// - Returns: JSONString.
    func ConvertDictionaryToJsonString(object : NSDictionary) -> Data {
        var jsonData : Data = Data()
        do {
            jsonData = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            // here "decoded" is an `AnyObject` decoded from JSON data
            // you can now cast it with the right type
            if let dictFromJSON = decoded as? [String:String] {
                print(dictFromJSON)
                // use dictFromJSON
            }
        } catch let error as NSError {
            print(error)
        }
        return jsonData
    }
    //MARK:- UPLOAD_IMAGE_WEBSERVICE_CALL_METHOD
    
    
    /// This function is use to upload image on server.
    ///
    /// - Parameters:
    ///   - parameters: Request parameters.
    ///   - arrImg: Collection of images in array.
    ///   - arrImgKey: Collection of keys for images.
    ///   - forWebServiceCall: webservice url.
    ///   - setHTTPMethod    : It should be GET httpMethod
    ///   - successBlock     : This block will success or failure response.
    func UploadImagesWebServiceCallMethod(parameters: NSDictionary, UIImage arrImg: NSArray, withImageControl arrImgKey: NSArray, forWebServiceCall: String, setHTTPMethod: String,successBlock:@escaping (_ responseData:AnyObject,_ isSuccess:Bool)->Void) {
        
        //let session = NSURLSession.sharedSession()
        let session = URLSession(configuration:URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue .current)
        let url: NSURL = NSURL(string: forWebServiceCall)!
        let urlRequest = NSMutableURLRequest(url: url as URL)
        urlRequest.httpMethod = setHTTPMethod
        let boundary: String = generateBoundaryString()
        // post body
        let body = NSMutableData()
        
        let contentType: String = "multipart/form-data; boundary=\(boundary)"
        
        urlRequest.addValue(contentType, forHTTPHeaderField: "Content-Type")
        urlRequest .addValue("bFcwUEJUN0lhekVkREVZTzduVHQ=", forHTTPHeaderField: "Api-Key")
        urlRequest.httpBody = createBodyWithParametersForImages(parameters: parameters, boundary: boundary, filePathKey :arrImgKey, arrImage : arrImg) as Data
        let postLength: String = String (format: "%lu",body .length)
        urlRequest .setValue(postLength, forHTTPHeaderField: "Content-Length")
        let task = session.dataTask(with: urlRequest as URLRequest) { data, response, error in
            // Get responce
             var json = [String : AnyObject]()
            do {
                json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as! [String : AnyObject]
                successBlock(json as AnyObject, true)
            } catch {
                successBlock(json as AnyObject,false)
                print(error)
                print("error : catch block execute")
            }
        }
        task.resume()
    }
   
    
    /// This function is use to create httpBody for NSMutableURLRequest.
    ///
    /// - Parameters:
    ///   - parameters: Request parameters.
    ///   - boundary: NSUUID().uuidString
    ///   - filePathKey:  Collection of keys for images.
    ///   - arrImage: Collection of images in array.
    /// - Returns: NSData.
    func createBodyWithParametersForImages(parameters: NSDictionary?,boundary: String, filePathKey : NSArray, arrImage: NSArray) -> NSData {
        let body = NSMutableData()
        
        if parameters != nil {
            for (key, value) in parameters! {
                
                if(value is String || value is NSString){
                    body.appendString(string: "--\(boundary)\r\n")
                    body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                    body.appendString(string: "\(value)\r\n")
                }
            }
            if arrImage.count > 0 && filePathKey.count == arrImage.count {
                
                for i in 0 ..< arrImage.count{
                   
                    var data = Data()
                    
                    let filename = "image\(i).jpg"
                    if arrImage[i] as? UIImage == UIImage(named:"reg_profile"){
                        print("No profile pic selected")
                    }else{
                         data = UIImageJPEGRepresentation(arrImage[i] as! UIImage,1)!;
                    }
                    
                        let mimetype = "png"
                        body.appendString(string: "--\(boundary)\r\n")
                        body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey[i])\"; filename=\"\(filename)\"\r\n")
                        body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
                        body.append(data)
                        body.appendString(string: "\r\n")
                    }
                }
        }
        body.appendString(string: "--\(boundary)--\r\n")
        return body
    }
    
    
    /// This function is use to generateBoundaryString.
    ///
    /// - Returns: generated BoundaryString as string.
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
}
