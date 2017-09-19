//
//  CustomNibTableViewCell.swift
//  TableViewNibPractice
//
//  Created by 박종찬 on 2017. 7. 3..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class CustomNibTableViewCell: UITableViewCell {
    
    @IBOutlet weak var squareImageView: UIImageView!
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var subTitleTextLabel: UILabel!
    @IBOutlet weak var cellSwitchAcc: UISwitch!
    
    static let reuseId: String = "CustomCell"
    static let cellHeight: CGFloat = 80.0

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
