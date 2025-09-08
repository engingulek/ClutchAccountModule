//
//  SingUpPresenter.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 6.09.2025.
//

@MainActor
class SingUpPresenter {
  weak  var view: (any PresenterToViewSingUpProtocol)?
    private var interactor : PresenterToInteractorSingUpProtocol
    private var router : PresenterToRouterSingUpProtocol
    private var textState: TextState  =  TextState()

    init(view: (any PresenterToViewSingUpProtocol)?,
         interactor: PresenterToInteractorSingUpProtocol,
         router: PresenterToRouterSingUpProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
    }
        
    
}



extension SingUpPresenter :  @preconcurrency  ViewToPresenterSingUpProtocol {
    
    
    func viewDidLoad() {
        view?.sendTextState(text: textState)
    }
    
    
    func onTappedGoogleButton() {
        
    }
    
    func onTappedAppleButton() {
        
    }
    
    func onChangedFirstNameTextField(text: String?) {
        
    }
    
    func onChangedLastNameTextField(text: String?) {
        
    }
    
    func onChangedEmailTextField(text: String?) {
        
    }
    
    func onChangedPasswordTextField(text: String?) {
        
    }
    
    func onTappedSingUpButton() {
        router.toSelectFavTeamScreen(view: view)
        print("testt")
    }
    
}


extension SingUpPresenter : @preconcurrency InteractorToPresenterSingUpProtocol {
    func singUpResult() {
        
    }
    
    
}
