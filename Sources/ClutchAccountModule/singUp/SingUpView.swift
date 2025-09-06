//
//  SingUpView.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 6.09.2025.
//

import UIKit
import SnapKit
import ClutchCoreKit


class SingUpView : BaseView<SingUpViewController> {
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
    
    private lazy var singUpTitleleLabel = LabelFactory.createLabel(ofType: .largeTitle, text: " ")
    
    private lazy var subinfoLabel = LabelFactory.createLabel(ofType: .body, text: "")
    
    private lazy var googleButton = ButtonFactory.createButton(ofType: .buttonWithImageResource(image: .googleIcon, title: "", action: googleButtonAction, color: .black, backColor: .white))
    
    
    private lazy var googleButtonAction : UIAction = UIAction {[weak self] _ in
        guard let self = self else {return}
        
        print("googleButtonAction")
    }
    
    private lazy var appleButton = ButtonFactory.createButton(
        ofType: .buttonWithImageResource(image: .appleIcon, title: "", action: appleButtonAction, color: .black, backColor: .white))
    
    private lazy var appleButtonAction : UIAction = UIAction {[weak self] _ in
        guard let self = self else {return}
        
    }
    
    private lazy var orLabel = LabelFactory.createLabel(ofType: .body, text: "")
    
    private lazy var firstNameLabel = LabelFactory.createLabel(ofType: .subBody, text: "")
    
    private lazy var lastNameLabel = LabelFactory.createLabel(ofType: .subBody, text: "")
    
    private lazy var emailLabel = LabelFactory.createLabel(ofType: .subBody, text: "")
    
    private lazy var passwordLabel = LabelFactory.createLabel(ofType: .subBody, text: "")
    
    
    private let firstNameTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .emailAddress
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.tag = 0
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    
    private let lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .emailAddress
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.layer.cornerRadius = 10
        tf.tag = 1
        return tf
    }()
    
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.keyboardType = .emailAddress
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.layer.cornerRadius = 10
        tf.tag = 2
        return tf
    }()
    
 
    
 
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        tf.tag = 3
        return tf
    }()
    
    private lazy var singUpButton = ButtonFactory.createButton(ofType: .defaultButton(title: "", action: singUpButtonAction))
    
    private lazy var singUpButtonAction : UIAction = UIAction { [weak self] _ in
        guard let self = self else {return}
       
     }
    
    
    
    
    override func setupView() {
        configureUI()
        subinfoLabel.numberOfLines = .zero
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
        
        addSubview(singUpTitleleLabel)
        singUpTitleleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(30)
            make.left.equalTo(snp.left).offset(20)
        }
        addSubview(subinfoLabel)
        subinfoLabel.snp.makeConstraints { make in
            make.top.equalTo(singUpTitleleLabel.snp.bottom).offset(8)
            make.left.equalTo(snp.left).offset(20)
            make.trailing.equalTo(snp.trailing).offset(-20)
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
        googleButton.layer.borderColor = UIColor.lightGray.cgColor
        appleButton.layer.borderColor = UIColor.lightGray.cgColor
        
        
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
        
        addSubview(firstNameLabel)
        firstNameLabel.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(20)
            make.left.equalTo(snp.left).offset(20)
        }
        
        addSubview(firstNameTextField)
        firstNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(10)
            make.leading.equalTo(firstNameLabel.snp.leading)
            
            make.height.equalTo(50)
            make.width.equalTo((UIScreen.main.bounds.width / 2) - 25)
        }
        
        
        addSubview(lastNameTextField)
        lastNameTextField.snp.makeConstraints { make in
            make.top.equalTo(firstNameTextField.snp.top)
            make.trailing.equalTo(snp.trailing).offset(-20)
            
            make.height.equalTo(50)
            make.width.equalTo((UIScreen.main.bounds.width / 2) - 25)
        }
        
        addSubview(lastNameLabel)
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalTo(orLabel.snp.bottom).offset(20)
            make.trailing.equalTo(lastNameTextField.snp.trailing)
            make.leading.equalTo(lastNameTextField.snp.leading)
        }
        
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(lastNameTextField.snp.bottom).offset(20)
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
        
        
        addSubview(singUpButton)
        singUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(50)
            
        }
    }
    
    
    func getText(_ text:TextState) {
        appNameTitleLabel.text = text.appName
        singUpTitleleLabel.text = text.singUpPageTitle
        subinfoLabel.text = text.singUpPageSubTitle
        googleButton.setTitle(text.googleButtonTitle, for: .normal)
        appleButton.setTitle(text.appleButtonTitle, for: .normal)
        orLabel.text = text.orLabel
        firstNameLabel.text = text.firstName
        firstNameTextField.placeholder = text.firstName
        lastNameLabel.text = text.lastName
        lastNameTextField.placeholder = text.lastName
        emailLabel.text = text.emailAdressTitle
        emailTextField.placeholder = text.emailAdressTextField
        passwordLabel.text = text.passwordTitle
        passwordTextField.placeholder = text.passwordTextField
        singUpButton.setTitle(text.singUpLabel, for: .normal)
    }
}
