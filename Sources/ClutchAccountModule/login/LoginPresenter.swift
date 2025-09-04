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
    
    func viewDidLoad() {
        
        
        view?.sendTextState(text: textState)
    }
    
    
}
