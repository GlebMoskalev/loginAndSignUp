//
//  passwordTextField.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 06.04.2024.
//

import UIKit

class PasswordTextField: EmailTextField{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTextField(){
        let widthButton = Int(frame.size.width / 11)
        isSecureTextEntry = true
        let eyeButton = UIButton(frame: CGRect(x: 0, y: 0, width: widthButton, height: widthButton - 10))
        var buttonEyeConfiguration = UIButton.Configuration.plain()
        buttonEyeConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        buttonEyeConfiguration.baseBackgroundColor = .clear
        eyeButton.configuration = buttonEyeConfiguration
        let eyeImage = UIImage(named: "eye")?.resizeImageTo(size: CGSize(width: widthButton - 10, height: widthButton - 10))
        let eyeCloseImage = UIImage(named: "eye close")?.resizeImageTo(size: CGSize(width: 25, height: 25))
        eyeButton.setImage(eyeImage, for: .normal)
        eyeButton.setImage(eyeCloseImage, for: .selected)
        eyeButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        rightView = eyeButton
        rightViewMode = .always
    }
    
    @objc private func showHidePassword(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        isSecureTextEntry = !isSecureTextEntry
    }
    
//    override func isValidTextField() -> Bool {
//        if let password = text{
//            
//        }
//    }
}


extension UIImage {
    
    func resizeImageTo(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
