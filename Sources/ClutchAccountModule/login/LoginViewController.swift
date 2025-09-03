//
//  LoginViewController.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//

import Foundation
import UIKit
import SnapKit
import ClutchCoreKit

class LoginViewController : UIViewController {
    lazy var presenter : ViewToPresenterLoginProtocol = LoginPresenter(view: self)
    private lazy var iconImage : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .appIcon)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        return imageView
    }()
    
    
    private lazy var rightLine : UIView = {
        let view = UIView()
        view.backgroundColor =  .lightGray
        return view
    }()
    
    private lazy var leftLine : UIView = {
        let view = UIView()
        view.backgroundColor =  .lightGray
        return view
    }()
    
    
    private lazy var appNameTitleLabel = LabelFactory.createLabel(ofType: .title,text: "Clutch")
    
    private lazy var welcomemleLabel = LabelFactory.createLabel(ofType: .largeTitle, text: "Welcome Back")
    
    private lazy var subinfoLabel = LabelFactory.createLabel(ofType: .body, text: "Enter your login information")
    
    private lazy var emailLabel = LabelFactory.createLabel(ofType: .subBody, text: "Email Address")
    
    private lazy var passwordLabel = LabelFactory.createLabel(ofType: .subBody, text: "Password")
  
    
    
    
    private lazy var googleButton = ButtonFactory.createButton(ofType: .buttonWithImageResource(image: .googleIcon, title: "Google", action: googleButtonAction, color: .black, backColor: .white))
    
    
    private lazy var googleButtonAction : UIAction = UIAction { _ in
        print("googleButtonAction")
     }
    
    private lazy var appleButton = ButtonFactory.createButton(
        ofType: .buttonWithImageResource(image: .appleIcon, title: "Apple", action: appleButtonAction, color: .black, backColor: .white))
    
    private lazy var appleButtonAction : UIAction = UIAction { _ in
        print("apple button aciton")
    }
    
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email Address"
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 10
        return tf
    }()
    
 
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        return tf
    }()
    
    
    private lazy var togglePasswordButton = ButtonFactory.createButton(ofType: .buttonWithOnlyImageSN(image: "eye.slash", action: togglePasswordButtonAction, backColor: .white))
    
    
    private lazy var togglePasswordButtonAction : UIAction = UIAction { _ in
        self.passwordTextField.isSecureTextEntry.toggle()
        let imageName = self.passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        self.togglePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    
    private lazy var orLabel = LabelFactory.createLabel(ofType: .body, text: "OR")

    
    private lazy var nohaveAccountLabel = LabelFactory.createLabel(ofType: .subBody, text: "Don't have an account")
  
    
    private lazy var toSignUpButton = ButtonFactory.createButton(ofType: .textButton(text: "Sign up", color: .black, action: toSignUpButtonAction))
    
    
    private lazy var toSignUpButtonAction : UIAction = UIAction { _ in
        print("toSignButton")
     }
        
    
    
    
    private lazy var loginButton = ButtonFactory.createButton(ofType: .defaultButton(title: "Login", action: loginButtonAction))
    
    
    private lazy var loginButtonAction : UIAction = UIAction { _ in
        print("loginButtonAction")
     }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
   
    }

    
    
    
    @objc func googleTapped() {
        print("Google button tapped")
    }
    
    @objc func appleTapped() {
        print("Apple button tapped")
    }
    
    @objc func onTappedSingUp() {
        print("On Tapped Sing Up bttn")
    }
    

    private func configureUI() {
        view.addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.width.height.equalTo(50)
        }
        view.addSubview(appNameTitleLabel)
        appNameTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage.snp.centerY)
            make.left.equalTo(iconImage.snp.right).offset(8)
        }
        
        view.addSubview(welcomemleLabel)
        welcomemleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(40)
            make.left.equalTo(view.snp.left).offset(20)
        }
        view.addSubview(subinfoLabel)
        subinfoLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomemleLabel.snp.bottom).offset(8)
            make.left.equalTo(view.snp.left).offset(20)
        }
        
        let buttonStack = UIStackView(arrangedSubviews: [googleButton, appleButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 16
        buttonStack.distribution = .fillEqually
        view.addSubview(buttonStack)
        
        buttonStack.snp.makeConstraints { make in
            make.top.equalTo(subinfoLabel.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(50)
        }
        
        
        view.addSubview(orLabel)
        orLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonStack.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
        }
        
        
        view.addSubview(leftLine)
        leftLine.snp.makeConstraints { make in
            make.centerY.equalTo(orLabel)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(orLabel.snp.left).offset(-10)
            make.height.equalTo(1)
        }
        view.addSubview(rightLine)
        rightLine.snp.makeConstraints { make in
            make.centerY.equalTo(orLabel)
            make.left.equalTo(orLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        passwordTextField.rightView = togglePasswordButton
        passwordTextField.rightViewMode = .always
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(50)
            
        }
        
        view.addSubview(nohaveAccountLabel)
        
        let container = UIStackView(arrangedSubviews: [nohaveAccountLabel, toSignUpButton])
        container.axis = .horizontal
        container.spacing = 4
        container.alignment = .center
        view.addSubview(container)

        container.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
}




extension LoginViewController : PresenterToViewLoginProtocol {
    
}


#Preview {
    LoginViewController()
}




