//
//  Extension.swift
//  InstagramSample
//
//  Created by youngmin joo on 2017. 7. 24..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit


extension UIColor
{
    static func rgbColor(_ red:CGFloat, _ green:CGFloat,_ blue:CGFloat) -> UIColor
    {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}

extension UIView
{
    func anchor(top:NSLayoutYAxisAnchor?,
                left:NSLayoutXAxisAnchor?,
                right:NSLayoutXAxisAnchor?,
                bottom:NSLayoutYAxisAnchor?,
                topContant:CGFloat,
                leftContant:CGFloat,
                rightContant:CGFloat,
                bottomContant:CGFloat,
                width:CGFloat,
                height:CGFloat,
                centerX:NSLayoutXAxisAnchor?,
                centerY:NSLayoutYAxisAnchor?
                )
    {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top
        {
            self.topAnchor.constraint(equalTo: top, constant: topContant).isActive = true
        }
        if let left = left
        {
            self.leftAnchor.constraint(equalTo: left, constant: leftContant).isActive = true
        }
        if let right = right
        {
            self.rightAnchor.constraint(equalTo: right, constant: -rightContant).isActive = true
        }
        if let bottom = bottom
        {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomContant).isActive = true
        }
        
        if width > 0
        {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height > 0
        {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let centerX = centerX
        {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY
        {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
}


extension UIStackView
{
    func addArrangedSubviews(_ views:[UIView])
    {
        views.forEach { (view) in
            self.addArrangedSubview(view)
        }
        
//        for v in views
//        {
//            self.addArrangedSubview(v)
//        }
        
    }
}


