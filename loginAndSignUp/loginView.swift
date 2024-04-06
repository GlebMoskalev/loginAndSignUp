//
//  loginView.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 06.04.2024.
//

import UIKit
import SnapKit

class loginView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = UIColor(named: "LoginAndSignUpColor")
        
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "Poppins", size: 20)
        emailLabel.textColor = UIColor(named: "BackgroundColor")
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(frame.size.width * 0.12)
            make.top.equalToSuperview()
            make.width.equalTo(frame.size.width).multipliedBy(0.2)
        }
        
        let emailTextField = emailTextField(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 0))
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom)
            make.left.equalToSuperview().inset(frame.size.width * 0.12)
            make.right.equalToSuperview().inset(frame.size.width * 0.12)
            make.height.equalToSuperview().multipliedBy(0.13)
        }
        
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "Poppins", size: 20)
        passwordLabel.textColor = UIColor(named: "BackgroundColor")
        addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(frame.size.width * 0.12)
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.width.equalTo(frame.size.width).multipliedBy(0.2)
        }
        
        let passwordTextField = passwordTextField(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom)
            make.left.equalToSuperview().inset(frame.size.width * 0.12)
            make.right.equalToSuperview().inset(frame.size.width * 0.12)
            make.height.equalToSuperview().multipliedBy(0.13)
        }
        
        let loginButton = UIButton()
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Poppins", size: 35)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(named: "BackgroundColor")
        addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(frame.size.width * 0.2)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.12)
        }
        loginButton.layer.cornerRadius = frame.size.width * 0.3 / 8
        loginButton.titleLabel?.adjustsFontSizeToFitWidth = true
        loginButton.titleLabel?.minimumScaleFactor = 0.4
        
        let signUpLabel = UILabel()
        signUpLabel.font = UIFont(name: "Poppins", size: 12)
        signUpLabel.text = "or sign up here"
        signUpLabel.textColor = UIColor(named: "BackgroundColor")
        addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
}
