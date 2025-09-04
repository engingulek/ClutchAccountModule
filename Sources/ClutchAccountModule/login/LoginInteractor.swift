//
//  LoginInteractor.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 4.09.2025.
//


class LoginInteractor : PresenterToInteractorLoginProtocol {
    var presenter : InteractorToPresenterLoginProtocol?
    func loginEmailAndPassword(email: String, password: String) {
        //TODO: NetworkManager will be added
        
        //if failure
        presenter?.loginResult(result: .failure(LoginError.noneEmail))
        
        //if success
        presenter?.loginResult(result: .success("Success"))
    }
    
    
}
