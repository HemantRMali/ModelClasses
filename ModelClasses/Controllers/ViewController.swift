//
//  ViewController.swift
//  ModelClasses
//
//  Created by Hemant on 31/01/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet var tblData : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let TOKEN = USER_DEFAULTS.value(forKey: "Token")
        if TOKEN != nil {
            let url = NSURL(string: "\(SERVER_DOMAIN_PATH)/v6/BulkDataSync")
            let request = NSMutableURLRequest(url: url as! URL)
            request.httpMethod = "POST"
            request.setValue((TOKEN as! String), forHTTPHeaderField: "Token")
            request.setValue("31010", forHTTPHeaderField: "sourceSystemId")
            request.setValue("27808", forHTTPHeaderField: "buId")
            request.setValue(MAC_UUID, forHTTPHeaderField: "macId")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

