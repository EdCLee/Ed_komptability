//
//  ProfileInfoHeader.swift
//  InstagramSample
//
//  Created by youngmin joo on 2017. 7. 25..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class ProfileInfoHeader: UICollectionViewCell {
    
    var user:User?{
        didSet{
            usernameLabel.text = user?.userName
            
            if let urlStr = user?.userProfileImgUrl,
                let url = URL(string: urlStr)
            {
                
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                    
                    print("response://",response)
                    print("data://",data)
                    
                    let r = response as? HTTPURLResponse
                    r?.statusCode
                    if let err = error
                    {
                        print("erroe://",err)
                        return
                    }
                    guard let realData = data else {return}
                    
                    DispatchQueue.main.async {
                        self.profileImageView.image = UIImage(data: realData)
                    }
                    
                    
                }.resume()
            }
            
            
//            profileImageView.image = ??
        }
    }
    
    //data
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "plus_photo")
        
        return iv
    }()
    
    let gridButton: UIButton = {
        let button = UIButton(type : .system)
        button.setImage(#imageLiteral(resourceName: "grid"), for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    let listButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "list"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        return button
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ribbon"), for: .normal)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        button.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        return button
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    func handleAction()
    {
        print("action")
    }
    
    let postsLabel: UILabel = {
        let label = UILabel()
        
//        let attributedText = NSMutableAttributedString(string: "11\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
//        
//        attributedText.append(NSAttributedString(string: "posts", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        
        let str = "11\nposts"
        
//        label.attributedText = attributedText
        label.text = str
        label.font = UIFont.systemFont(ofSize: 14)
        
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "0\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "followers", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "0\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "following", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, right: nil, bottom: nil, topContant: 12, leftContant: 12, rightContant: 0, bottomContant: 0, width: 80, height: 80, centerX: nil, centerY: nil)
        profileImageView.layer.cornerRadius = 80 / 2
        profileImageView.clipsToBounds = true
        
        setupBottomToolbar()
        
        addSubview(usernameLabel)
        usernameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: gridButton.topAnchor, topContant: 4, leftContant: 12, rightContant: 12, bottomContant: 0, width: 0, height: 0, centerX: nil, centerY: nil)

        
        setupUserStatsView()
        
        addSubview(editProfileButton)
        editProfileButton.anchor(top: postsLabel.bottomAnchor, left: postsLabel.leftAnchor, right: followersLabel.rightAnchor, bottom: nil, topContant: 2, leftContant: 0, rightContant: 0, bottomContant: 0, width: 0, height: 34, centerX: nil, centerY: nil)
        
    }
    
    fileprivate func setupUserStatsView() {
        let stackView = UIStackView(arrangedSubviews: [postsLabel, followersLabel, followingLabel])
        
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: profileImageView.rightAnchor, right: rightAnchor, bottom: nil, topContant: 12, leftContant: 12, rightContant: 12, bottomContant: 0, width: 0, height: 50, centerX: nil, centerY: nil)
    }
    
    fileprivate func setupBottomToolbar() {
        
        let topDividerView = UIView()
        topDividerView.backgroundColor = UIColor.lightGray
        
        let bottomDividerView = UIView()
        bottomDividerView.backgroundColor = UIColor.lightGray
        
        let stackView = UIStackView(arrangedSubviews: [gridButton, listButton, bookmarkButton])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        addSubview(topDividerView)
        addSubview(bottomDividerView)
        
        stackView.anchor(top: nil, left: leftAnchor, right: rightAnchor, bottom: bottomAnchor, topContant: 0, leftContant: 0, rightContant: 0, bottomContant: 0, width: 0, height: 50, centerX: nil, centerY: nil)
        
        
        topDividerView.anchor(top: stackView.topAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topContant: 0, leftContant: 0, rightContant: 0, bottomContant: 0, width: 0, height: 0.5, centerX: nil, centerY: nil)
        
        bottomDividerView.anchor(top: stackView.bottomAnchor, left: leftAnchor, right: rightAnchor, bottom: nil, topContant: 0, leftContant: 0, rightContant: 0, bottomContant: 0, width: 0, height: 0.5, centerX: nil, centerY: nil)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
}
