//
//  LoginViewController.swift
//  InstagramSample
//
//  Created by youngmin joo on 2017. 7. 24..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    let logoContainerView: UIView = {
        let view = UIView()
        
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white") )
        logoImageView.contentMode = .scaleAspectFill
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: nil, left: nil, right: nil, bottom: nil, topContant: 0, leftContant: 0, rightContant: 0, bottomContant: 0, width: 200, height: 50, centerX: nil, centerY: nil)
        
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.backgroundColor = UIColor.rgbColor(0, 120, 175)
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor.rgbColor( 149,  204, 244)
        
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        button.isEnabled = false
        
        return button
    }()
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.lightGray])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.rgbColor(17, 154, 237)
            ]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()

    
    func handleTextInputChange() {
        let isFormValid = emailTextField.text?.characters.count ?? 0 > 0 && passwordTextField.text?.characters.count ?? 0 > 0
        
        if isFormValid {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.rgbColor(17, 154, 237)
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.rgbColor(149, 204, 244)
        }
    }
    
    func handleLogin() {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if let error =  error
            {
                print("error://", error)
                return
            }
            //success
            print("userID", user?.uid)
            
            
            self.navigationController?.dismiss(animated: true, completion: nil)
            
        }
    }
    
    
    func handleShowSignUp() {
        let signupVC = SignupViewController()
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        

        view.addSubview(logoContainerView)
        logoContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topContant: 0, leftContant: 0, rightContant: 0, bottomContant: 0, width: 0, height: 150, centerX: nil, centerY: nil)
        
        
        stackView.addArrangedSubviews([emailTextField, passwordTextField, loginButton])
        view.addSubview(stackView)
        stackView.anchor(top: logoContainerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, bottom: nil, topContant: 40, leftContant: 40, rightContant: 40, bottomContant: 0, width: 0, height: 140, centerX: nil, centerY: nil)
        
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, right: view.rightAnchor, bottom: view.bottomAnchor, topContant: 0, leftContant: 0, rightContant: 0, bottomContant: 0, width: 0, height: 50, centerX: nil, centerY: nil)
        
    }
    
    
}
