//
//  SingUpRouter.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 6.09.2025.
//

import UIKit
@MainActor

class SingUpRouter {
    static func createLoginViewController() -> UIViewController {
        let viewController = SingUpViewController()
        let router = SingUpRouter()
        let interactor = SingUpInteractor()
        let presenter : ViewToPresenterSingUpProtocol & InteractorToPresenterSingUpProtocol
        = SingUpPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
        
    }
    
}


extension SingUpRouter : PresenterToRouterSingUpProtocol {
    
}
