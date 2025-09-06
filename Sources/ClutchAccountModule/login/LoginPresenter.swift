//
//  AccountPresenter.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//



@MainActor
final class LoginPresenter {
    weak var view : PresenterToViewLoginProtocol?
    private var interactor : PresenterToInteractorLoginProtocol
    private var router : PresenterToRouterLoginProtocol
    private var textState: TextState  =  TextState()
    
    init(view: PresenterToViewLoginProtocol?,interactor : PresenterToInteractorLoginProtocol,router : PresenterToRouterLoginProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension LoginPresenter : @preconcurrency ViewToPresenterLoginProtocol {
    
    
    func viewDidLoad() {
        view?.sendTextState(text: textState)
    }
 
    
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
    
   
    
  
    
    
}


extension LoginPresenter : @preconcurrency InteractorToPresenterLoginProtocol {
    func loginResult(result: LoginResult) {
        
    }
    
    
}
