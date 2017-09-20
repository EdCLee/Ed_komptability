//
//  SignUpViewController.swift
//  InstagramSample
//
//  Created by CLEE on 24/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
//MARK: ACTION////////////////////////////////////////
    // 버튼 생성
    let photoBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("사진", for: .normal)
        btn.setTitleColor(UIColor(red:100, green: 100, blue: 100, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(photoActionHandler), for: .touchUpInside)
        
        // 이걸 false로 주어야지만 AutoLayout이 적용된다.
        /* By default, the autoresizing mask on a view gives rise to constraints that fully determine
         the view's position. This allows the auto layout system to track the frames of views whose
         layout is controlled manually (through -setFrame:, for example).
         When you elect to position the view using auto layout by adding your own constraints,
         you must set this property to NO. IB will do this for you.
         */
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        //btn.backgroundColor = .red
        return btn
    }() //closure
    
    
    
    let signUpBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("회원가입", for: .normal)
        btn.setTitleColor(UIColor(red:100, green: 100, blue: 100, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(signUpActionHandler), for: .touchUpInside)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.backgroundColor = UIColor(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        
        return btn
    }() //closure
    
    
    
    
//MARK: PROPERTIES////////////////////////////////////
    // text field 생성
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input email"
//        tf.backgroundColor = .gray
//        tf.layer.cornerRadius = 10
        tf.borderStyle = .roundedRect //default 3
        tf.textAlignment = .center
        
        return tf
    }()
    
    let userNameTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input name"
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        
        return tf
    }()

    let pwTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input password"
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        
        return tf
    }()

//    let pwCheckTextField:UITextField = {
//        let tf = UITextField()
//        tf.placeholder = "input password"
//        tf.borderStyle = .roundedRect
//        tf.textAlignment = .center
//        
//        return tf
//    }()
    
    let verticalStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()

    let horizontalStackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()

    
    
    
    
//MARK: APP CYCLE/////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AUTO LAYOUT
        // AutoLayout을 할땐 addsubview를 먼저 해주고 AutoLayout을 주어야 한다.
        view.addSubview(photoBtn)

        //self.view.backgroundColor = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1) //or .ye]
        self.view.backgroundColor = .white
        //photoBtn.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        
        verticalStackView.addArrangedSubviews([emailTextField, userNameTextField, pwTextField, signUpBtn])
        view.addSubview(verticalStackView)
        
        setUpSubViewLayout()
        
        //setUpStackView()
       
    }

    
//MARK: METHOD////////////////////////////////////////
    
//    fileprivate func setUpStackView() {
//        // STACK VIEW with emailTextField and AutoLayout
//        let stackView = UIStackView(arrangedSubviews: [emailTextField, userNameTextField, pwTextField, pwCheckTextField, signUpBtn])
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        //stackView.backgroundColor = .red //이거 안됨.
//        stackView.spacing = 10
//        view.addSubview(stackView)
//        
//        // stackView Auto Layout
//        //stackView.topAnchor.constraint(equalTo: photoBtn.bottomAnchor, constant: 40).isActive = true
//        //stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        //stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        //stackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        
//        stackView.anchor(top: photoBtn.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topConstant: 40, leftConstant: 20, rightConstant: 20, bottomConstant: 0, width: 0, height: 130, centerX: nil, centerY: nil)
//    }

    fileprivate func setUpSubViewLayout() {
        //photoBtn의 위치 조정 AutoLayout
        //photoBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        //photoBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        //photoBtn.heightAnchor.constraint(equalToConstant: 120).isActive = true
        //photoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //photoBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        // 공식을 이용해서 작성하는 방법.
//        let l1 = NSLayoutConstraint(item: photoBtn, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 10)
//        view.addConstraint(l1)
        
        // 위의 코드를 이렇게 변환 가능 extension 만세!!
        photoBtn.anchor(top: view.topAnchor,
                        left: nil,
                        right: nil,
                        bottom: nil,
                        topConstant: 40,
                        leftConstant: 0,
                        rightConstant: 0,
                        bottomConstant: 0,
                        width: 120,
                        height: 120,
                        centerX: view.centerXAnchor,
                        centerY: nil)
        
        
        //photoBtn의 shapes
        photoBtn.backgroundColor = UIColor(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        //photoBtn.layer.cornerRadius = photoBtn.frame.size.width / 2
        photoBtn.layer.cornerRadius = 120 / 2
        photoBtn.layer.borderWidth = 1
        photoBtn.mask?.clipsToBounds = true

        
        //setUpStackView()를 삭제하면서 여기로 이동.
        verticalStackView.anchor(top: photoBtn.bottomAnchor,
                                 left: view.leftAnchor,
                                 right: view.rightAnchor,
                                 bottom: nil,
                                 topConstant: 40,
                                 leftConstant: 20,
                                 rightConstant: 20,
                                 bottomConstant: 0,
                                 width: 0,
                                 height: 0,
                                 centerX: nil,
                                 centerY: nil)
        
    }
    
    func photoActionHandler() {
        print("action PhotoBtn")
    }
    
    func signUpActionHandler() {
        
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: pwTextField.text!) { (user, error) in
            
            if let error = error {
                print("error://", error)
                return
            }
            
            guard let userName = self.userNameTextField.text else { return }
            
            //SUCCESS
//            let uid = user?uid
            
//            Database.database().reference().child(uid).updateChildValues(["userName":userName], withCompletionBlock:{ (error, ref)
//                print("database error://", error)
//                print("database reference://", ref)
//                
//                )
//            }
            print("userData://", user)
            print("error://", error)
            print("action signUpBtn")
        }
    }

    

}
