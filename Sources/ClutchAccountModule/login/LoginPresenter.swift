//
//  AccountPresenter.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//

final class LoginPresenter {
    weak var view : PresenterToViewLoginProtocol?
    
    init(view: PresenterToViewLoginProtocol?) {
        self.view = view
    }
    
}


extension LoginPresenter : ViewToPresenterLoginProtocol {
    func viewDidLoad() {
        
    }
    
    
}
