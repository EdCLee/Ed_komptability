//
//  CustomTableViewCell.swift
//  PartyRoyalPairPrograming
//
//  Created by HwangGisu on 2017. 6. 15..
//  Copyright © 2017년 HwangGisu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var userInfoTextField: UserInfoTextField?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
