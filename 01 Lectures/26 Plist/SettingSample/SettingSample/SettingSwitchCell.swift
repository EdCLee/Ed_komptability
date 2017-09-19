//
//  SettingSwitchCell.swift
//  SettingSample
//
//  Created by CLEE on 20/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class SettingSwitchCell: UITableViewCell {
    
    // switch outlet
    @IBOutlet var switcher:UISwitch!
    @IBOutlet var titleLb:UILabel!
    
    var delegate:SettingSwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    // cell title 설정
    func setTitle(_ title:String) {
        titleLb.text = title
    }
    
    // switch cell 의 액션
    @IBAction func switcherValueChange(_ sender:UISwitch) {
        
        delegate?.cellValueChanged(self, isOn: sender.isOn)
        
    }

}


protocol SettingSwitchCellDelegate {

    func cellValueChanged(_ cell:SettingSwitchCell, isOn:Bool)

}
