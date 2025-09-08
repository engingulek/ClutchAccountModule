//
//  SingUpViewController.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 6.09.2025.
//

import Foundation
import UIKit
import SnapKit
import ClutchCoreKit

class SingUpViewController : UIViewController {
    lazy var presenter : ViewToPresenterSingUpProtocol = SingUpPresenter(
        view: self,
        interactor: SingUpInteractor(),
        router: SingUpRouter())
    private lazy var singUpView =  SingUpView(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        singUpView.delegate = self
    }
    
    
    override func loadView() {
        view = singUpView
        
    }
    
    
  
}


extension SingUpViewController : PresenterToViewSingUpProtocol {
    func sendTextState(text: TextState) {
        singUpView.getText(text)
    }
}


extension SingUpViewController : SingUpViewDelegate {
    func didTapAppleButton() {
        presenter.onTappedAppleButton()
    }
    
    func didTapGoogleButton() {
        presenter.onTappedGoogleButton()
    }
    
    func didTapSingUpButton() {
        presenter.onTappedSingUpButton()
    }
    
    func onChangeFirstNameTextFied(text: String?) {
        presenter.onChangedFirstNameTextField(text: text)
    }
    
    func onChageLastNameTextField(text: String?) {
        presenter.onChangedLastNameTextField(text: text)
    }
    
    func onChangeEmailTextFied(text: String?) {
        presenter.onChangedEmailTextField(text: text)
    }
    
    func onChagePasswordTextField(text: String?) {
        presenter.onChangedPasswordTextField(text: text)
    }
    
    
}


#Preview {
    SingUpViewController()
}




