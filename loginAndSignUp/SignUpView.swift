//
//  signUpView.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 06.04.2024.
//

import UIKit
import SnapKit

class SignUpView: LoginView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupView(){
        super.setupView()
        emailLabel.text = "Enter email"
        passwordLabel.text = "Create password"
        signUpLabel.text = "Or Login here"
        loginButton.setTitle("Sign up", for: .normal)
        
        let repeatPasswordLabel = UILabel()
        repeatPasswordLabel.text = "Repeat password"
        repeatPasswordLabel.font = UIFont(name: "Poppins", size: 20)
        repeatPasswordLabel.textColor = UIColor(named: "BackgroundColor")
        addSubview(repeatPasswordLabel)
     
        
        if let passwordTextField = passwordTextField{
            repeatPasswordLabel.snp.makeConstraints { make in
                make.left.equalToSuperview().inset(frame.size.width * 0.12)
                make.top.equalTo(passwordTextField.snp.bottom).offset(10)
                make.width.equalTo(frame.size.width).multipliedBy(0.2)
            }
            
            let repeatPasswordTextField = PasswordTextField(frame: CGRect(x: 0, y: 0, width: passwordTextField.frame.size.width, height: passwordTextField.frame.size.height))
            addSubview(repeatPasswordTextField)
            repeatPasswordTextField.snp.makeConstraints { make in
                make.top.equalTo(repeatPasswordLabel.snp.bottom)
                make.left.equalTo(passwordTextField)
                make.right.equalTo(passwordTextField)
                make.width.height.equalTo(passwordTextField)
            }

            loginButton.snp.remakeConstraints { make in
                make.top.equalTo(repeatPasswordTextField.snp.bottom).offset(frame.size.width * 0.1)
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalToSuperview().multipliedBy(0.12)
            }
        }
        
    }
}
