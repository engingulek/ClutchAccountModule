//
//  AccountViewController.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//

import Foundation
import UIKit
import SnapKit


class AccountViewController : UIViewController {
    lazy var presenter : ViewToPresenterAccontProtocol = AccountPresenter(view: self)
    private lazy var iconImage : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .appIcon)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        return imageView
    }()
    
    
    private lazy var appNameTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Clutch"
        label.font = UIFont.systemFont(ofSize: 29, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var welcomemleLabel : UILabel = {
        let label = UILabel()
        label.text = "Welcome Back"
        label.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    private lazy var subinfoLabel : UILabel = {
        let label = UILabel()
        label.text = "Enter your login information"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .darkGray
        return label
    }()
    
    
    private lazy var googleButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Google"
        config.titleAlignment = .center
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            outgoing.foregroundColor = UIColor.black
            return outgoing
        }
        
        let originalImage = UIImage(resource: .googleIcon)
        let resizedImage = originalImage.resize(to: CGSize(width: 20, height: 20))
        config.image = resizedImage
        config.imagePlacement = .leading
        config.imagePadding = 8
        
        config.baseBackgroundColor = .white
        config.cornerStyle = .medium // köşe yarıçapı
        config.baseForegroundColor = .black
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(googleTapped), for: .touchUpInside)
        return button
        
    }()
    
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email Address"
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 10
        return tf
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let togglePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .black
        return button
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
    
    
    private lazy var orLabel : UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var appleButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Apple"
        config.titleAlignment = .center
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            outgoing.foregroundColor = UIColor.black
            return outgoing
        }
        
        let originalImage = UIImage(resource: .appleIcon)
        let resizedImage = originalImage.resize(to: CGSize(width: 20, height: 20))
        config.image = resizedImage
        config.imagePlacement = .leading
        config.imagePadding = 8
        
        config.baseBackgroundColor = .white
        config.cornerStyle = .medium
        config.baseForegroundColor = .black
        
        let button = UIButton(configuration: config, primaryAction: nil)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(appleTapped), for: .touchUpInside)
        return button
    }()
    
    private let nohaveAccountLabel: UILabel = {
            let label = UILabel()
            label.text = "Don't have an account"
            label.textColor = .darkGray
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
        
        private let toSingUpButton: UIButton = {
            let button = UIButton(type: .system)
            let attributedTitle = NSAttributedString(
                string: "Sign up",
                attributes: [
                    .foregroundColor: UIColor.black,
                    .font: UIFont.systemFont(ofSize: 14, weight: .semibold),
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ]
            )
            button.addTarget(self, action: #selector(onTappedSingUp), for: .touchUpInside)
            button.setAttributedTitle(attributedTitle, for: .normal)
            return button
        }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
        setupActions()
        //  setupViews()
    }
    

    
    private func setupActions() {
        togglePasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
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
    
    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash" : "eye"
        togglePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
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
        
      
        view.addSubview(toSingUpButton)
        
        
        let container = UIStackView(arrangedSubviews: [nohaveAccountLabel, toSingUpButton])
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




extension AccountViewController : PresenterToViewAccountProtocol {
    
}


#Preview {
    AccountViewController()
}



extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        let newSize = CGSize(width: size.width * widthRatio, height: size.height * heightRatio)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? self
    }
    
    func resize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
