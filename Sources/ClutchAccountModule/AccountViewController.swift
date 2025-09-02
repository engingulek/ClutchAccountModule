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
