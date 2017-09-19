//
//  TwitDynamicCell.swift
//  TwitterDynamicCellPractice
//
//  Created by 박종찬 on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class TwitDynamicCell: UITableViewCell {
    
    @IBOutlet weak var bodyTextLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var contentStack: UIStackView!
    var twitImageButton: UIButton!
    var isDisplayingImageButton: Bool = false
    var delegate: TwitDynamicCellDelegate?
    
    @IBAction func profileButtonTouched(_ sender: UIButton) {
        
        delegate?.showProfileView(self)
        
    }
    
    func twitImageButtonTouched(_ sender: UIButton) {
        
        delegate?.showTwitImageController(self)
        
    }
    
    override func awakeFromNib() {
        self.profileButton.layer.cornerRadius = 30.0
        self.profileButton.clipsToBounds = true
        
        twitImageButton = UIButton()
        //        twitImageButton.contentMode = UIViewContentMode.scaleAspectFill
        twitImageButton.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        twitImageButton.clipsToBounds = true
        let heightConst = NSLayoutConstraint.init(item: twitImageButton, attribute: .height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 100.0)
        twitImageButton.addTarget(self, action: #selector(twitImageButtonTouched(_:)), for: UIControlEvents.touchUpInside)
        twitImageButton.addConstraint(heightConst)
    }
    
    var data: Twit! {
        didSet { //이미 self.data set된상태
            self.bodyTextLabel.text = data.bodyText
            self.profileButton.setImage(UIImage(named: data.userPhotoUrl), for: UIControlState.normal)
            
            self.userNameLabel.text = data.userName
            self.userIdLabel.text = data.userId
            
            if let twitImg: UIImage = UIImage(named: data.imageUrl ?? "") {
                if !isDisplayingImageButton {
                    twitImageButton.setImage(twitImg, for: UIControlState.normal)
                    self.contentStack.addArrangedSubview(self.twitImageButton)
                    self.isDisplayingImageButton = true
                }
            } else {
                if self.isDisplayingImageButton {
                    self.contentStack.removeArrangedSubview(self.twitImageButton)
                    self.isDisplayingImageButton = false
                }
            }
            
        }
    }
    
    
}

protocol TwitDynamicCellDelegate {
    func showProfileView(_ cell:TwitDynamicCell)
    func showTwitImageController(_ cell:TwitDynamicCell)
}
