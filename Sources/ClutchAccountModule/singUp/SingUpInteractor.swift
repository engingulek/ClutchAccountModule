//
//  SingUpInteractor.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 6.09.2025.
//

class SingUpInteractor : PresenterToInteractorSingUpProtocol {
    
    var presenter : InteractorToPresenterSingUpProtocol?
    
    
    func singUpEmailAndPassword(data: SingUpData) {
        //TODO: NetworkManager will be added
        
        presenter?.singUpResult()
    }
    
}
