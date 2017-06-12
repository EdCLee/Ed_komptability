//
//  CustomDelegate.swift
//  CustomDelegate
//
//  Created by CLEE on 12/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

protocol CustomDelegate {
    func didSelectedItem(item:CustomView)
    func isAbleToTouch() -> Bool
}

class CustomView: UIView {
    var delegate:CustomDelegate?
    
    @IBOutlet var imgView:UIImageView?
    @IBOutlet var txtLabel:UILabel?
    @IBOutlet var coverBtn:UIButton?
    
    @IBAction func coverBtnAction(_ sender:UIButton){
        if delegate?.isAbleToTouch() ?? false {
            delegate?.didSelectedItem(item: self)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //label
        self.txtLabel?.text = "ReFun?"
        self.txtLabel?.textColor = UIColor.black
        
        self.imgView?.image = UIImage(named: "Refund_w")
        
        
        // Button title setting
        self.coverBtn?.setTitle("", for: .normal)
        self.coverBtn?.setTitleColor(UIColor.white, for: .normal)
        
        
        
    }
    
    func setTitleText(_ text:String){
        if let textLB = txtLabel {
            textLB.text = text
        }
    }
}
