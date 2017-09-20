//
//  MyTableViewCell.swift
//  CustomTableViewCell
//
//  Created by CLEE on 12/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var textLB:UILabel?
    @IBOutlet var BgImage:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setBackGroundImage(name:String) {
        self.BgImage?.image = UIImage(named: name)
        
    }
    
    func setTextLabel(text:String) {
        self.textLB?.text = text
    }
}
