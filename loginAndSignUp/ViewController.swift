//
//  ViewController.swift
//  loginAndSignUp
//
//  Created by Глеб Москалев on 04.04.2024.
//

import UIKit
import SnapKit

enum action {
    case login, signUp
    
    func getWelcomeText() -> String {
        switch self{
        case .login:
            return "Welcome back!"
        case .signUp:
            return "Join now!"
        }
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVIew()
    }
    
    let welcomeLabel = UILabel()
    let loginButton = UIButton()
    let viewLoginAndSignUp = UIView()
    let signUpButton = UIButton()
    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    
    var actionNow = action.login {
        didSet{
            welcomeLabel.text = actionNow.getWelcomeText()
        }
    }
    
    private func configureVIew(){
//        let customView = loginView(frame: .zero)
//        view.addSubview(customView)
//        customView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.left.equalToSuperview()
//            make.width.equalToSuperview()
//            make.height.equalTo(200)
//        }
        
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let heyLabel = UILabel()
        heyLabel.text = "Hey!"
        heyLabel.font = UIFont(name: "Poppins", size: 70)
        heyLabel.textColor = .white
        view.addSubview(heyLabel)
        heyLabel.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(view.safeAreaLayoutGuide.layoutFrame.size.height * 0.2)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(0.4)
        }
        heyLabel.adjustsFontSizeToFitWidth = true
        heyLabel.minimumScaleFactor = 0.5
        

        
        welcomeLabel.text = action.login.getWelcomeText()
        welcomeLabel.font = UIFont(name: "Poppins", size: 40)
        welcomeLabel.textColor = .white
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(heyLabel.snp.bottom).inset(20)
            make.width.equalTo(view.safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
        }
        welcomeLabel.adjustsFontSizeToFitWidth = true
        welcomeLabel.minimumScaleFactor = 0.8

        
        viewLoginAndSignUp.backgroundColor = UIColor(named: "LoginAndSignUpColor")
        view.addSubview(viewLoginAndSignUp)
        viewLoginAndSignUp.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom)
            make.bottom.equalToSuperview()
        }
        viewLoginAndSignUp.layer.cornerRadius = view.safeAreaLayoutGuide.layoutFrame.width / 8
        viewLoginAndSignUp.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setUnderline()
        loginButton.titleLabel?.font = UIFont(name: "Poppins", size: 20)
        loginButton.setTitleColor(UIColor(named: "BackgroundColor"), for: .normal)
        viewLoginAndSignUp.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().offset(view.safeAreaLayoutGuide.layoutFrame.width * 0.2)
        }
        loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchUpInside)
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Poppins", size: 20)
        signUpButton.setTitleColor(UIColor(named: "BackgroundColor"), for: .normal)
        viewLoginAndSignUp.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(view.safeAreaLayoutGuide.layoutFrame.width * 0.2)
        }
        signUpButton.addTarget(self, action: #selector(signUpButtonTap), for: .touchUpInside)
        
        let loginView = loginView(frame: CGRect(x: 0, y: 0, width: viewLoginAndSignUp.safeAreaLayoutGuide.layoutFrame.width, height: 0))
        viewLoginAndSignUp.addSubview(loginView)
        loginView.snp.makeConstraints(({ make in
            make.top.equalTo(loginButton.snp.bottom).offset(viewLoginAndSignUp.safeAreaLayoutGuide.layoutFrame.width * 0.05)
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }))
        
//        emailLabel.text = "Email"
//        emailLabel.font = UIFont(name: "Poppins", size: 20)
//        emailLabel.textColor = UIColor(named: "BackgroundColor")
//        viewLogin.addSubview(emailLabel)
//        emailLabel.snp.makeConstraints { make in
//            make.left.equalTo(view.safeAreaLayoutGuide.layoutFrame.width * 0.12)
//            make.top.equalTo(loginButton.snp.bottom).offset(viewLogin.safeAreaLayoutGuide.layoutFrame.width * 0.05)
//            make.width.equalTo(viewLogin.safeAreaLayoutGuide.snp.width).multipliedBy(0.2)
//        }
//        
//        let emailTextFiel = UITextField()
//        emailTextFiel.layer.borderWidth = 2.0
//        emailTextFiel.layer.borderColor = UIColor(named: "BackgroundColor")?.cgColor
//        emailTextFiel.backgroundColor = .white
//        emailTextFiel.font = UIFont.systemFont(ofSize: 30)
//        emailTextFiel.textColor = UIColor.init(named: "BackgroundColor")
//        emailTextFiel.adjustsFontSizeToFitWidth = true
//        emailTextFiel.autocorrectionType = .no
//        emailTextFiel.autocapitalizationType = .none
//        emailTextFiel.minimumFontSize = 10
//        emailTextFiel.textAlignment = .right
//        let paddingView = UIView.init(frame: CGRect(x: 0, y: 0, width: viewLogin.safeAreaLayoutGuide.layoutFrame.width * 0.05, height: 0))
//        emailTextFiel.leftView = paddingView
//        emailTextFiel.leftViewMode = .always
//        emailTextFiel.rightView = paddingView
//        emailTextFiel.rightViewMode = .always
//    
//        viewLogin.addSubview(emailTextFiel)
//        emailTextFiel.snp.makeConstraints { make in
//            make.top.equalTo(emailLabel.snp.bottom)
//            make.left.equalToSuperview().inset(viewLogin.safeAreaLayoutGuide.layoutFrame.width * 0.1)
//            make.right.equalToSuperview().inset(viewLogin.safeAreaLayoutGuide.layoutFrame.width * 0.1)
//            make.height.equalTo(viewLogin.safeAreaLayoutGuide.layoutFrame.height * 0.1)
//        }
//        emailTextFiel.borderStyle = .none
//        emailTextFiel.layer.cornerRadius = viewLogin.safeAreaLayoutGuide.layoutFrame.width / 20
//        
//        
//        passwordLabel.text = "Password"
//        passwordLabel.font = UIFont(name: "Poppins", size: 20)
//        passwordLabel.textColor = UIColor(named: "BackgroundColor")
//        viewLogin.addSubview(passwordLabel)
//        passwordLabel.snp.makeConstraints { make in
//            make.left.equalTo(view.safeAreaLayoutGuide.layoutFrame.width * 0.12)
//            make.top.equalTo(emailTextFiel.snp.bottom).offset(viewLogin.safeAreaLayoutGuide.layoutFrame.width * 0.05)
//            make.width.equalTo(viewLogin.safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
//        }
        
    }
    
    @objc func loginButtonTap(sender: UIButton){
        actionNow = .login
        signUpButton.removeUnderline()
        loginButton.setUnderline()
    }

    @objc func signUpButtonTap(sender: UIButton){
        actionNow = .signUp
        loginButton.removeUnderline()
        signUpButton.setUnderline()
    }

}


extension UIButton {
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.thick.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
    
    func removeUnderline(){
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.removeAttribute(.underlineStyle, range: NSRange(location: 0, length: title.count))
        setAttributedTitle(attributedString, for: .normal)
    }
}
