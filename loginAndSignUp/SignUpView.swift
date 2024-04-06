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
    }
}
