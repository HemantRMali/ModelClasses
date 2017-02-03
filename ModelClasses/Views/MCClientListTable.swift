//
//  MCClientListTable.swift
//  ModelClasses
//
//  Created by Hemant on 03/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import UIKit

class MCClientListTable: UITableView {

    var dataSourceArray = [client]() {
        didSet{
        reloadData()
        }
    }
    // Progamaticaly : this initiazer will be call
    override init(frame: CGRect, style: UITableViewStyle){
        super.init(frame:frame, style:style)
    }
    
    //Drage and drop in storyboard, this initiazer will be call
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    //When table load on screen, this function will be call once
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate   = self
        self.dataSource = self
    }
}

extension MCClientListTable : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "clientListCell"
        
        var clientListCell : MCClientListCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MCClientListCell
        
        if  clientListCell == nil {
            clientListCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MCClientListCell
        }
        let myClients = dataSourceArray[indexPath.row]
        clientListCell .setClientListDetails(strFirstName: myClients.firstName, strLastName : myClients.lastName, strPartyId : myClients.partyId,strEmail: myClients.email)
        return clientListCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension MCClientListTable : UITableViewDataSource{
    
}

