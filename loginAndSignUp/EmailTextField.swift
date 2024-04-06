//
//  emailTextField.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 06.04.2024.
//

import UIKit

class EmailTextField: UITextField{
    
//    private var width: CGFloat
    
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
        textAlignment = .right
        let paddingView = UIView.init(frame: CGRect(x: 0, y: 0, width: frame.size.width * 0.05, height: 0))
        leftView = paddingView
        leftViewMode = .always
        rightView = paddingView
        rightViewMode = .always
        
        borderStyle = .none
        layer.cornerRadius = 20
    }
}
