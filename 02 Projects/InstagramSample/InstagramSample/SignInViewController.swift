//
//  SignInViewController.swift
//  InstagramSample
//
//  Created by CLEE on 24/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
//MARK: ACTION////////////////////////////////////////
    // 버튼 생성
    let photoBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("사진", for: .normal)
        btn.setTitleColor(UIColor(red:100, green: 100, blue: 100, alpha: 1), for: .normal)
        btn.addTarget(self, action: #selector(photoActionHandler), for: .touchUpInside)

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
    
    
    
//    let loginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Login", for: .normal)
//        button.backgroundColor = UIColor.rgbColor(149, 204, 244)
//        
//        button.layer.cornerRadius = 5
//        button.
//    }
//    
//    let dontHaveAccountButton: UIButton = {
//        let button = UIButton(type: .system)
//        
//        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?", attributes: [NSFontAttributeName:system])
//    }
    
    
    
//MARK: PROPERTIES////////////////////////////////////
    
    var gradientLayer:CAGradientLayer!
    

    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    
    
    // text field 생성
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.placeholder = "input email"
        tf.borderStyle = .roundedRect //default 3
        tf.textAlignment = .center
        
//        tf.addTarget(self, action: #selector(textInputChangeHandler), for: .editingChanged)
        
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
    func photoActionHandler() {
        print("action PhotoBtn")
    }
    
    func signUpActionHandler() {
        print("action signUpBtn")
    }
    
//    func textInputChangeHandler() {
//        let isFormValid = emailTextField.text?.characters.count ?? 0 > 0 && pwTextField.text?.characters.count ?? 0 > 0
//        
//        if isFormValid {
//            loginButton.isEnabled = true
//            loginButton.backgroundColor = UIColor.rgbColor(17, 154, 237)
//        } else {
//            loginButton.isEnabled = false
//            loginButton.backgroundColor = UIColor.rgbColor(149, 204, 244)
//        }
//    }
    
    func showSignUpHandler() {
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    fileprivate func setUpSubViewLayout() {
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
    
    func signInHandler() {
        Auth.auth().
    }
    
}
