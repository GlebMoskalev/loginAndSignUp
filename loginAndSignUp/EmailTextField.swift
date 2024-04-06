//
//  emailTextField.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 06.04.2024.
//

import UIKit

enum emailError: String {
    case invalidAddres = "Invalid email address"
    case userNotExist = "User with this email does not exist"
}


class EmailTextField: UITextField{
    private let dictionaryEmailPasswordTestUser = ["swift@icloud.com": "Swift#24"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField(){
        layer.borderWidth = 2.0
        layer.borderColor = UIColor(named: "BackgroundColor")?.cgColor
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 30)
        textColor = UIColor.init(named: "BackgroundColor")
        adjustsFontSizeToFitWidth = true
        autocorrectionType = .no
        autocapitalizationType = .none
        minimumFontSize = 10
//        textAlignment = .right
        let paddingView = UIView.init(frame: CGRect(x: 0, y: 0, width: frame.size.width * 0.05, height: 0))
        leftView = paddingView
        leftViewMode = .always
        rightView = paddingView
        rightViewMode = .always
        
        borderStyle = .none
        layer.cornerRadius = 20
    }
    
    func checkEmail() -> (error: String, isValid: Bool) {
        if let email = self.text, isValidEmail(email: email){
            if dictionaryEmailPasswordTestUser.keys.contains(email){
                return ("", true)
            }
            return (emailError.userNotExist.rawValue, false)
        }
        return (emailError.invalidAddres.rawValue, true)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
