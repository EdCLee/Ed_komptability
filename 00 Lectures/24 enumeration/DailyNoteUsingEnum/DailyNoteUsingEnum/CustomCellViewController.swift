//
//  CustomCellViewController.swift
//  DailyNoteUsingEnum
//
//  Created by CLEE on 14/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class CustomCellViewController: UITableViewCell {

    @IBOutlet weak var textFieldAtCell: UIView!
    @IBOutlet weak var dateFieldAtCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
