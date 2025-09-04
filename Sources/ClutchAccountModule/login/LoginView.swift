//
//  LoginView.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 3.09.2025.
//

import UIKit
import SnapKit
import ClutchCoreKit

@MainActor
protocol LoginViewDelegate: AnyObject {
    func didTapAppleButton()
    func didTapGoogleButton()
    func didTapLoginButton()
    func didTapSingUpButton()
    func onChangeEmailTextFied(text:String?)
    func onChagePasswordTextField(text:String?)
}


class LoginView : BaseView<LoginViewController> {
    
    weak var delegate: LoginViewDelegate?
    
    private lazy var iconImage : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .appIcon)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
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
    
    
    private lazy var appNameTitleLabel = LabelFactory.createLabel(ofType: .title,text: "")
    
    private lazy var welcomemleLabel = LabelFactory.createLabel(ofType: .largeTitle, text: " ")
    
    private lazy var subinfoLabel = LabelFactory.createLabel(ofType: .body, text: "")
    
    private lazy var emailLabel = LabelFactory.createLabel(ofType: .subBody, text: "")
    
    private lazy var passwordLabel = LabelFactory.createLabel(ofType: .subBody, text: "")
  
    
    private lazy var googleButton = ButtonFactory.createButton(ofType: .buttonWithImageResource(image: .googleIcon, title: "", action: googleButtonAction, color: .black, backColor: .white))
    
    
    private lazy var googleButtonAction : UIAction = UIAction {[weak self] _ in
        guard let self = self else {return}
        self.delegate?.didTapGoogleButton()
        print("googleButtonAction")
     }
    
    private lazy var appleButton = ButtonFactory.createButton(
        ofType: .buttonWithImageResource(image: .appleIcon, title: "", action: appleButtonAction, color: .black, backColor: .white))
    
    private lazy var appleButtonAction : UIAction = UIAction {[weak self] _ in
        guard let self = self else {return}
        self.delegate?.didTapAppleButton()
    }
    
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .emailAddress
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.layer.cornerRadius = 10
        
        return tf
    }()
    
 
    
 
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.tag = 1
        return tf
    }()
    
    private lazy var orLabel = LabelFactory.createLabel(ofType: .body, text: "")

    
    private lazy var nohaveAccountLabel = LabelFactory.createLabel(ofType: .subBody, text: "")
  
    
    private lazy var toSignUpButton = ButtonFactory.createButton(ofType: .textButton(text: "",
                                                                                     color: .black, action: toSignUpButtonAction))
    
    
    private lazy var toSignUpButtonAction : UIAction = UIAction {[weak self] _ in
        guard let self = self else {return}
        self.delegate?.didTapSingUpButton()
        print("toSignButton")
     }
    
    private lazy var loginButton = ButtonFactory.createButton(ofType: .defaultButton(title: "", action: loginButtonAction))
    
    
    private lazy var loginButtonAction : UIAction = UIAction { [weak self] _ in
        guard let self = self else {return}
        self.delegate?.didTapLoginButton()
     }
    
    override func setupView() {
        configureUI()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    

    
    private func configureUI() {
        addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(snp.left).offset(20)
            make.width.height.equalTo(50)
        }
        addSubview(appNameTitleLabel)
        appNameTitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImage.snp.centerY)
            make.left.equalTo(iconImage.snp.right).offset(8)
        }
        
        addSubview(welcomemleLabel)
        welcomemleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(40)
            make.left.equalTo(snp.left).offset(20)
        }
        addSubview(subinfoLabel)
        subinfoLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomemleLabel.snp.bottom).offset(8)
            make.left.equalTo(snp.left).offset(20)
        }
        
        let buttonStack = UIStackView(arrangedSubviews: [googleButton, appleButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 16
        buttonStack.distribution = .fillEqually
        addSubview(buttonStack)
        
        buttonStack.snp.makeConstraints { make in
            make.top.equalTo(subinfoLabel.snp.bottom).offset(30)
            make.left.equalTo(snp.left).offset(20)
            make.right.equalTo(snp.right).offset(-20)
            make.height.equalTo(50)
        }
        
        
        addSubview(orLabel)
        orLabel.snp.makeConstraints { make in
            make.top.equalTo(buttonStack.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
        }
        
        
        addSubview(leftLine)
        leftLine.snp.makeConstraints { make in
            make.centerY.equalTo(orLabel)
            make.left.equalToSuperview().offset(20)
            make.right.equalTo(orLabel.snp.left).offset(-10)
            make.height.equalTo(1)
        }
        addSubview(rightLine)
        rightLine.snp.makeConstraints { make in
            make.centerY.equalTo(orLabel)
            make.left.equalTo(orLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(1)
        }
        
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        addSubview(passwordLabel)
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(50)
            
        }
        
        addSubview(nohaveAccountLabel)
        
        let container = UIStackView(arrangedSubviews: [nohaveAccountLabel, toSignUpButton])
        container.axis = .horizontal
        container.spacing = 4
        container.alignment = .center
        addSubview(container)

        container.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
        }
    }
    
    
    func getText(_ text:TextState) {
        appNameTitleLabel.text = text.appName
        welcomemleLabel.text = text.loginTitle
        subinfoLabel.text = text.loginSubTitle
        emailLabel.text = text.emailAdressTitle
        passwordLabel.text = text.passwordTitle
        googleButton.setTitle(text.googleButtonTitle, for: .normal)
        appleButton.setTitle(text.appleButtonTitle, for: .normal)
        emailTextField.placeholder = text.emailAdressTextField
        passwordTextField.placeholder = text.passwordTextField
        orLabel.text = text.orLabel
        nohaveAccountLabel.text = text.noAccountLabel
        toSignUpButton.setTitle(text.singUpLabel, for: .normal)
        loginButton.setTitle(text.loginButtonTitle, for:.normal)
    }
    
    
  
}


extension LoginView : UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            delegate?.onChangeEmailTextFied(text: textField.text)
        case 1:
            delegate?.onChagePasswordTextField(text: textField.text)
        default:
            break
        }
    }
    
    
   
}
