//
//  loginView.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 06.04.2024.
//

import UIKit
import SnapKit

enum emailError: String {
    case invalidAddres = "Invalid email address"
    case userNotExist = "User with this email does not exist"
    case userExist = "User with this email already exists"
}


class LoginView: UIView{
    let dictionaryEmailPasswordTestUser = ["swift@icloud.com" : "Swift!24"]
    var isValidEmail = false
    var isValidPassword = false
    
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let signUpLabel = UILabel()
    let loginButton = UIButton()
    var passwordTextField: PasswordTextField?
    var emailTextField: EmailTextField?
    var errorLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        backgroundColor = UIColor(named: "pink")
        
        emailLabel.text = "Email"
        emailLabel.font = UIFont(name: "Poppins", size: 20)
        emailLabel.textColor = UIColor(named: "brown")
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(frame.size.width * 0.12)
            make.top.equalToSuperview()
            make.width.equalTo(frame.size.width).multipliedBy(0.2)
        }
        
        emailTextField = EmailTextField(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 0))
        addSubview(emailTextField!)
        emailTextField?.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom)
            make.left.equalToSuperview().inset(frame.size.width * 0.12)
            make.right.equalToSuperview().inset(frame.size.width * 0.12)
            make.height.equalToSuperview().multipliedBy(0.13)
        }
        
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont(name: "Poppins", size: 20)
        passwordLabel.textColor = UIColor(named: "brown")
        addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(frame.size.width * 0.12)
            make.top.equalTo(emailTextField!.snp.bottom).offset(10)
            make.width.equalTo(frame.size.width).multipliedBy(0.2)
        }
        
        passwordTextField = PasswordTextField(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        addSubview(passwordTextField!)
        passwordTextField!.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom)
            make.left.equalToSuperview().inset(frame.size.width * 0.12)
            make.right.equalToSuperview().inset(frame.size.width * 0.12)
            make.height.equalToSuperview().multipliedBy(0.13)
        }
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTouch), for: .touchUpInside)
        loginButton.titleLabel?.font = UIFont(name: "Poppins", size: 35)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(named: "brown")
        addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField!.snp.bottom).offset(frame.size.width * 0.2)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.12)
        }
        loginButton.layer.cornerRadius = frame.size.width * 0.3 / 8
        loginButton.titleLabel?.adjustsFontSizeToFitWidth = true
        loginButton.titleLabel?.minimumScaleFactor = 0.4
        
        signUpLabel.font = UIFont(name: "Poppins", size: 12)
        signUpLabel.text = "or sign up here"
        signUpLabel.textColor = UIColor(named: "brown")
        addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        errorLabel.font = UIFont(name: "Poppins", size: 15)
        errorLabel.textColor = .systemPink
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.bottom.equalTo(loginButton.snp.top)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func loginTouch(sender: UIButton){
        checkEmail()
        if !isValidEmail { return }
        CheckPassword()
        if !isValidPassword { return }
        
    }
    
    func checkEmail(){
        isValidEmail = false
        if emailTextField!.isValidEmail(){
            
            if let email = emailTextField!.text, dictionaryEmailPasswordTestUser.keys.contains(email){
                errorLabel.text = ""
                isValidEmail = true
                return
            }
            errorLabel.text = emailError.userNotExist.rawValue
            return
        }
        
        errorLabel.text = emailError.invalidAddres.rawValue
    }
    
    func CheckPassword(){
        if let password = passwordTextField?.text, dictionaryEmailPasswordTestUser.values.contains(password){
            isValidPassword = true
            errorLabel.text = ""
            return
        }
        errorLabel.text = PasswordError.incorrectPassword.rawValue
        isValidPassword = false
    }
}
