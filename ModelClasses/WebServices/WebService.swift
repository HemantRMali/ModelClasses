//
//  WebService.swift
//  NSUSRL_SESSION_SWIFT
//
//  Created by Hemant on 09/06/16.
//  Copyright © 2016 Hemant. All rights reserved.
//

import UIKit
import Foundation
@objc protocol WebServiceDelegate{
    
}

class WebService: NSObject,URLSessionDelegate,URLSessionDataDelegate {
    
    var delegate          :WebServiceDelegate!
    var receivedData = NSMutableData()
    
    //MARK:- ASYNCHRONOUS_REQUEST
    func asynchronousRequestCallMethod(qryString: String, forWebServiceCall: String, setHTTPMethod: String, successBlock:@escaping (_ responseData:AnyObject,_ isSuccess:Bool)->Void) {

        
        let url: NSURL = NSURL(string: forWebServiceCall)!
        let request = NSMutableURLRequest(url: url as URL)
        let params: String = qryString
        request.httpMethod = "POST"
        request .addValue("bFcwUEJUN0lhekVkREVZTzduVHQ=", forHTTPHeaderField: "Api-Key")
        request.httpBody = params.data(using: String.Encoding.utf8)
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
    func webServiceCallMethod(parameters: NSDictionary, forWebServiceCall: String, setHTTPMethod: String,successBlock:@escaping (_ responseData : AnyObject,_ isSuccess : Bool)->Void) {
        
        let session = URLSession(configuration:URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue .main)
        let url: NSURL = NSURL(string: forWebServiceCall)!
        let urlRequest = NSMutableURLRequest(url: url as URL)
        urlRequest.httpMethod = setHTTPMethod
        urlRequest.timeoutInterval = 60
        urlRequest .addValue("bFcwUEJUN0lhekVkREVZTzduVHQ=", forHTTPHeaderField: "Api-Key")
        if (try? JSONSerialization.data(withJSONObject: parameters, options: [])) != nil {
        
            //1) Custom delegate
            //2) system provided delegate
            let task = session.dataTask(with: urlRequest as URLRequest) { data, response, error in
                // Get responce
                var json = [String : AnyObject]()
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
    
    //MARK:- UPLOAD_IMAGE_WEBSERVICE_CALL_METHOD
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
        //        NSLog("data %@",NSString(data: body, encoding: NSUTF8StringEncoding)!);
        return body
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    /*
    //MARK:- SHOW LOADING HUD
    func showLoadingHUD(ViewController:UIViewController){
        if (self.HUD .superview == nil) {
            ViewController.view .addSubview(self.HUD)
            self.HUD .show(true)
        }else{
            print("HUD is nil")
        }
    }
    
    //MARK:- SHOW LOADING HUD WITH TEXT
    func showLoadingHUDWithText(ViewController:UIViewController,text:String){
        if (self.HUD .superview == nil) {
            ViewController.view .addSubview(self.HUD)
            self.HUD.labelText = text
            self.HUD .show(true)
        }else{
            print("HUD is nil")
        }
    }
    
    //MARK:- HIDE LOADING HUD
    func hideLoadingHUD(){
        dispatch_async(dispatch_get_main_queue()) {
            self.HUD .removeFromSuperview()
        }
    }
  */
}
