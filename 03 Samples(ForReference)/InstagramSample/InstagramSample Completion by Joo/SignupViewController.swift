//
//  SignupViewController.swift
//  InstagramSample
//
//  Created by youngmin joo on 2017. 7. 24..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import Firebase


class SignupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    let photoBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("사진", for: .normal)
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100) , for: .normal)
        btn.addTarget(self, action:#selector(photoActionHandel) , for: .touchUpInside)
        
        btn.backgroundColor = .red
        return btn
    }()
    
    
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input email"
        tf.backgroundColor = .gray
//        tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect
        return tf
    }()
    let userNameTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input User Name"
        tf.backgroundColor = .gray
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    let pwTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input Password"
        tf.backgroundColor = .gray
        tf.layer.cornerRadius = 10
        
        return tf
    }()
    
    let signupBtn:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(UIColor.rgbColor(100, 100, 100) , for: .normal)
        btn.addTarget(self, action:#selector(signupActionHandel) , for: .touchUpInside)
        btn.backgroundColor = .red
        return btn
    }()
    
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 7
        return stackView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        //Add SubView
        view.addSubview(photoBtn)
        
        stackView.addArrangedSubviews([emailTextField, userNameTextField, pwTextField, signupBtn])
        view.addSubview(stackView)
        
        //UI
        setUpSubViewsLayout()
    }
    


    fileprivate func setUpSubViewsLayout()
    {
        
        photoBtn.anchor(top: view.topAnchor, left: nil, right: nil, bottom: nil, topContant: 40, leftContant: 0, rightContant: 0, bottomContant: 0, width: 120, height: 120, centerX: view.centerXAnchor, centerY: nil)
     
        stackView.anchor(top: photoBtn.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topContant: 40, leftContant: 20, rightContant: 20, bottomContant: 0, width: 0, height: 130, centerX: nil, centerY: nil)
        
        
        photoBtn.layer.cornerRadius = 120/2
        photoBtn.layer.borderWidth = 1
        photoBtn.layer.backgroundColor = UIColor.black.cgColor
    }
    
    
    func photoActionHandel()
    {
        print("action PhotoBtn")
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("info://",info)
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        image.withRenderingMode(.alwaysOriginal)
        photoBtn.setImage(image, for: .normal)
        photoBtn.clipsToBounds = true
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    func signupActionHandel()
    {
                            
        Auth.auth().createUser(withEmail: emailTextField.text!, password: pwTextField.text!) { (user, error) in
            
            if let error = error{
                print("error://",error)
                return
            }

            
            guard let userName = self.userNameTextField.text else {return}
            //success
            guard let uid = user?.uid else {return}
        
            
            guard let image = self.photoBtn.imageView?.image else {return}
            guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else {return}
            
            
            let uuid = UUID().uuidString
            
            Storage.storage().reference().child("ProfileImage").child(uuid).putData(uploadData, metadata: nil, completion: { (metaData, error) in
                
                if let error = error
                {
                    print("error://",error)
                    return
                }
                
                print("metaData://",metaData)
                guard let urlStr = metaData?.downloadURL()?.absoluteString else {return}
                print(urlStr)
                
                Database.database().reference().child(uid).child("UserInfo").updateChildValues(["userName":userName,"profileImg":urlStr], withCompletionBlock: { (error, ref) in
                
                    if let error = error
                    {
                        print("error://",error)
                        return
                    }
                                        
                    //mainPage이동
                    self.navigationController?.dismiss(animated: true, completion: nil)
                })
                
            })

        }
    
    }
}
