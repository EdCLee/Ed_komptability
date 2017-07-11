//
//  GameView.swift
//  HackerThoneDraft
//
//  Created by Dong Yoon Han on 7/6/17.
//  Copyright © 2017 DY. All rights reserved.
//

import UIKit

class GameView: UIView {
    var numberOfRows:Int = 25
    var numberOfCols:Int = 25
    var sideScalar:CGFloat?
    var gameViewMax:CGFloat?
    var viewArray:[UIView] = []

    override func awakeFromNib() {
        super.awakeFromNib()

        for _ in 0..<numberOfRows
        {
            for _ in 0..<numberOfCols
            {
                let squareCell = UIView()
                squareCell.backgroundColor = .yellow
                self.viewArray.append(squareCell)
                self.addSubview(squareCell)
            }
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        sideScalar = (self.superview?.frame.width)! / CGFloat(numberOfRows)
        gameViewMax = self.frame.width - sideScalar!
        print("self.frame.width : \(String(describing: self.frame.width))!)")
        print("self.superview.frame.width : \(String(describing: self.superview?.frame.width))!)")

        var index:Int = 0
        for squareCell in viewArray {
            let x = index % numberOfCols
            let y = index / numberOfCols
            squareCell.layer.borderWidth = 0.4
            squareCell.layer.borderColor = UIColor.black.cgColor
            squareCell.frame = CGRect(x: CGFloat(x) * sideScalar!, y: CGFloat(y) * sideScalar!, width: sideScalar!, height: sideScalar!)
            index += 1
        }
    }
}
