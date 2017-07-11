//
//  CustomVIewCellCollectionViewCell.swift
//  CollectionVIewSample
//
//  Created by CLEE on 03/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class CustomVIewCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLb:UILabel!
    
    //
    override func awakeFromNib() {
        let bgView = UIView()
        bgView.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        
        self.selectedBackgroundView = bgView
    }
    
    func set(title aTitle:String) {
        self.titleLb.text = aTitle
    }
}
