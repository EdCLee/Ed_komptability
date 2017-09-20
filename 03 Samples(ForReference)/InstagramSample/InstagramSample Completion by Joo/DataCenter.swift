//
//  DataCenter.swift
//  InstagramSample
//
//  Created by youngmin joo on 2017. 7. 26..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation
import Firebase

class DataCenter {
    static let sharedData = DataCenter()
    
    var isLogin:Bool = false
    
    
    func requestIsLogin() -> Bool {
        if Auth.auth().currentUser == nil
        {
            isLogin = false
            return false
        }else
        {
            isLogin = true
            return true
        }
    }
    
    func requsetUserData(completion: @escaping (_ info:User) -> Void)
    {
        guard let uid =  Auth.auth().currentUser?.uid else {return}
        
        Database.database().reference().child(uid).child("UserInfo").observeSingleEvent(of: .value, with: { (snapShot) in
            
            let dic = snapShot.value as! [String:Any]            
            completion(User(data: dic))
        })
    }
    

}












struct User {
  
    var userName:String
    var userProfileImgUrl:String
    var email:String?
    
    
    //["userName":userName,"profileImg":urlStr]
    init(data:[String:Any]) {
        email = Auth.auth().currentUser?.email
        userName = data["userName"] as? String ?? ""
        userProfileImgUrl = data["profileImg"] as? String ?? ""
        
    }
    
}
