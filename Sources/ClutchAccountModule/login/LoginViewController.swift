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
    lazy var presenter : ViewToPresenterLoginProtocol = LoginPresenter(view: self, interactor: LoginInteractor(), router: LoginRouter())
    private lazy var loginView = LoginView(self)
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        loginView.delegate = self
       
      
   
    }
    
    override func loadView() {
        view = loginView
        
    }

}


extension LoginViewController : PresenterToViewLoginProtocol {
    func sendTextState(text:TextState) {
            loginView.getText(text)
    }
}


extension LoginViewController : LoginViewDelegate {
   
    
    func didTapAppleButton() {
        presenter.onTappedAppleButton()
    }
    
    func didTapGoogleButton() {
        presenter.onTappedGoogleButton()
    }
    
    func didTapLoginButton() {
        presenter.onTappedLoginButton()
    }
    
    func didTapSingUpButton() {
        presenter.onTappedSingUpButton()
    }
    
    func onChangeEmailTextFied(text: String?) {
        presenter.onChangedEmailTextField(text: text)
    }
    
    func onChagePasswordTextField(text: String?) {
        presenter.onChangedPasswordTextField(text: text)
    }
}





#Preview {
    LoginViewController()
}




