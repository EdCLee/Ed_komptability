//
//  CustomTableViewCell.swift
//  TwitterDynamicCellPractice
//
//  Created by CLEE on 13/07/2017.
//  Copyright © 2017 Jongchan Park. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImgButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var bodyTextLabel: UILabel!
    @IBOutlet weak var contentImgButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol TwitDynamicCellDelegate {
    func showProfileView(_ cell)
    
}
