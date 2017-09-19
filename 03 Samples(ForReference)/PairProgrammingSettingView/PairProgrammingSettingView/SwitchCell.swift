//
//  SwitchCell.swift
//  PairProgrammingSettingView
//
//  Created by 박종찬 on 2017. 6. 20..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {
    
    var cellSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cellSwitch = UISwitch()
        self.cellSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
        
        self.accessoryView = self.cellSwitch
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cellSwitch.isOn = UserDefaults.standard.bool(forKey: (self.textLabel?.text)!)
    }
    
    func switchToggled(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: (self.textLabel?.text)!)
    }

}
