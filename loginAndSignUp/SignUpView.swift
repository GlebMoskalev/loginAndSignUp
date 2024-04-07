//
//  signUpView.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 06.04.2024.
//

import UIKit
import SnapKit

enum PasswordError: String {
    case weakPassword = "Password must be at least 8 characters long"
    case missingUppercase = "Password must contain at least one uppercase letter"
    case missingLowercase = "Password must contain at least one lowercase letter"
    case missingDigit = "Password must contain at least one digit"
    case missingSpecialCharacter = "Password must contain at least one special character"
    case passwordMismatch = "Passwords do not match"
    case incorrectPassword = "Incorrect password"
}

class SignUpView: LoginView{
    
    var repeatPasswordTextField: PasswordTextField?
    
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
        repeatPasswordLabel.textColor = UIColor(named: "brown")
        addSubview(repeatPasswordLabel)
     
        
        if let passwordTextField = passwordTextField{
            repeatPasswordLabel.snp.makeConstraints { make in
                make.left.equalToSuperview().inset(frame.size.width * 0.12)
                make.top.equalTo(passwordTextField.snp.bottom).offset(10)
                make.width.equalTo(frame.size.width).multipliedBy(0.2)
            }
            
            repeatPasswordTextField = PasswordTextField(frame: CGRect(x: 0, y: 0, width: passwordTextField.frame.size.width, height: passwordTextField.frame.size.height))
            addSubview(repeatPasswordTextField!)
            repeatPasswordTextField!.snp.makeConstraints { make in
                make.top.equalTo(repeatPasswordLabel.snp.bottom)
                make.left.equalTo(passwordTextField)
                make.right.equalTo(passwordTextField)
                make.width.height.equalTo(passwordTextField)
            }

            loginButton.snp.remakeConstraints { make in
                make.top.equalTo(repeatPasswordTextField!.snp.bottom).offset(frame.size.width * 0.1)
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalToSuperview().multipliedBy(0.12)
            }
        }
    }
    
    override func checkEmail() {
        isValidEmail = false
        if emailTextField!.isValidEmail(){
            if let email = emailTextField!.text, dictionaryEmailPasswordTestUser.keys.contains(email){
                errorLabel.text = emailError.userExist.rawValue
                return
            }
            isValidEmail = true
            errorLabel.text = ""
            return
        }
        errorLabel.text = emailError.invalidAddres.rawValue
    }
    
    override func CheckPassword() {
        isValidPassword = false
        if let password = passwordTextField?.text {
            if password.count < 8{
                errorLabel.text = PasswordError.weakPassword.rawValue
                return
            }
            let uppercaseLetterRegex  = ".*[A-Z]+.*"
            let uppercasePredicate = NSPredicate(format:"SELF MATCHES %@", uppercaseLetterRegex)
            let uppercaseResult = uppercasePredicate.evaluate(with: password)
            if !uppercaseResult{
                errorLabel.text = PasswordError.missingUppercase.rawValue
                return
            }
            
            let lowercaseLetterRegex = ".*[a-z]+.*"
            let lowercasePredicate = NSPredicate(format:"SELF MATCHES %@", lowercaseLetterRegex)
            let lowercaseResult = lowercasePredicate.evaluate(with: password)
            if !lowercaseResult{
                errorLabel.text = PasswordError.missingLowercase.rawValue
                return
            }
            
            let digitRegex = ".*[0-9]+.*"
            let digitPredicate = NSPredicate(format:"SELF MATCHES %@", digitRegex)
            let digitResult = digitPredicate.evaluate(with: password)
            if !digitResult{
                errorLabel.text = PasswordError.missingDigit.rawValue
                return
            }
            
            let specialCharacterRegex = ".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]+.*"
            let specialPredicate = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegex)
            let specialResult = specialPredicate.evaluate(with: password)
            if !specialResult{
                errorLabel.text = PasswordError.missingSpecialCharacter.rawValue
                return
            }
            
            if let repeatPassword = repeatPasswordTextField?.text, repeatPassword != password{
                errorLabel.text = PasswordError.passwordMismatch.rawValue
                return
            }
            
            errorLabel.text = ""
        }
    }
    
}
