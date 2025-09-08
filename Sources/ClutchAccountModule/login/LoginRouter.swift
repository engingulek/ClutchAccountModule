//
//  LoginRouter.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 4.09.2025.
//
import UIKit
@MainActor
class LoginRouter {
    static func createLoginViewController() -> UIViewController {
        let viewController = LoginViewController()
        let router = LoginRouter()
        let interactor = LoginInteractor()
        let presenter :
        ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol =
        LoginPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        
        return viewController
    }
}


extension LoginRouter : @preconcurrency PresenterToRouterLoginProtocol {
    func toSingUpScreen(view: (any PresenterToViewLoginProtocol)?) {
        let viewController = SingUpRouter.createLoginViewController()
        view?.pushViewControllerAble(viewController, animated: true)
    }
    
    
}
