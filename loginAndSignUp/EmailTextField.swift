//
//  emailTextField.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 06.04.2024.
//

import UIKit

class EmailTextField: UITextField{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField(){
        layer.borderWidth = 2.0
        layer.borderColor = UIColor(named: "brown")?.cgColor
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 30)
        textColor = UIColor.init(named: "brown")
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
    
    
    func isValidEmail() -> Bool{
        if let email = text{
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
        return false
    }
}
