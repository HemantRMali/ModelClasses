//
//  MCClientListCell.swift
//  ModelClasses
//
//  Created by Hemant on 03/02/17.
//  Copyright © 2017 Hemant. All rights reserved.
//

import UIKit

class MCClientListCell: UITableViewCell {
    
    @IBOutlet var lblFirstName : UILabel!
    @IBOutlet var lblLastName  : UILabel!
    @IBOutlet var lblPartyId   : UILabel!
    @IBOutlet var lblEmail     : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    /// This function is use set clientDetails
    ///
    /// - Parameters:
    ///   - strFirstName: First name of client
    ///   - strLastName: Last name of client
    ///   - strPartyId: PartyID of client
    ///   - strEmail: EMail address of client
    open func setClientListDetails(strFirstName: String, strLastName : String, strPartyId : String,strEmail: String){
        lblFirstName.text = "FirstName:\(strFirstName)"
        lblLastName.text  = "LastName:\(strLastName)"
        lblPartyId.text   = "PartyId:\(strPartyId)"
        lblEmail.text     = "Email:\(strEmail)"
    }
}
