//
//  AccountPresenter.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//



@MainActor
final class LoginPresenter {
    weak var view : PresenterToViewLoginProtocol?
    private var textState: TextState  =  TextState()
    
    init(view: PresenterToViewLoginProtocol?) {
        self.view = view
    }
    
}

extension LoginPresenter : @preconcurrency ViewToPresenterLoginProtocol {
 
    
    func onTappedGoogleButton() {
        
    }
    
    func onTappedAppleButton() {
        
    }
    
    func onChangedEmailTextField(text: String?) {
        
    }
    
    func onChangedPasswordTextField(text: String?) {
        
    }
    
    func onTappedSingUpButton() {
        
    }
    
    func onTappedLoginButton() {
        
    }
    
   
    
    
    func viewDidLoad() {
        
        
        view?.sendTextState(text: textState)
    }
    
    
}
