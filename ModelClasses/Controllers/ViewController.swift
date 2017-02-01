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
        
        let url = NSURL(string: "https://jsonplaceholder.typicode.com/users")
        let request = NSMutableURLRequest(url: url as! URL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
       
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

