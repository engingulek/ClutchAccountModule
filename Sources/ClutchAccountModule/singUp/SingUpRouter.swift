//
//  SingUpRouter.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 6.09.2025.
//

import UIKit
import ClutchModularProtocols
import ClutchNavigationKit
import SwiftUI
@MainActor

class SingUpRouter {
    @EnvironmentObject var navigation:Navigation
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


extension SingUpRouter : @preconcurrency PresenterToRouterSingUpProtocol {
    func toSelectFavTeamScreen(view:PresenterToViewSingUpProtocol?) {
        
        let selectFavTeamView = navigation.build(page: .selectFavTeam)
        
        let hostingController = UIHostingController(rootView: selectFavTeamView)
        
        view?.pushViewControllerAble(hostingController, animated: true)
        
    }
}
