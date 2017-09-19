//
//  CircleView.swift
//  CustomView
//
//  Created by CLEE on 12/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

protocol CircleViewDelegate {
    
    func didSelectedItem(item:CircleView)
    
    func isAbleToTouch() -> Bool
}

class CircleView: UIView {
    
    var delegate:CircleViewDelegate?
    
    @IBOutlet var title:UILabel?
    @IBOutlet var coverBtn:UIButton?
    @IBOutlet var ImgView:UIImageView?
    
    //protocol을 만들어서 함수를 선언하고
    // delegate라는 변수의 타입을 delegate로 명시해주고
    // 버튼 액션을 하면 delegate를 실행하고 자기 자신의 arguments를 선언.
    @IBAction func btnAction(_ sender:UIButton) {
        delegate?.didSelectedItem(item: self)
        
        if delegate?.isAbleToTouch() ?? false {
            delegate?.didSelectedItem(item:self)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.backgroundColor = UIColor.red.cgColor
        
        self.title?.text = "TOKYO OLYMPIC"
        self.title?.textColor = UIColor.white
        
        self.ImgView?.image = UIImage(named: "samurai.png")
        
        //self.goBtn?.setTitleColor(UIColor.white, for: .normal)
    }
    
    // 외부에서 텍스트를 받아 title Outlet에 표시하는 함수.
    func setTitleText(_ text:String) {
        if let titleLB = title {
            titleLB.text = text
        }
    }
    
    
}

