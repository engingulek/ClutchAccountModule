//
//  LoginViewController.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//

import Foundation
import UIKit
import SnapKit
import ClutchCoreKit

class LoginViewController : UIViewController {
    lazy var presenter : ViewToPresenterLoginProtocol = LoginPresenter(view: self)
    private lazy var loginView = LoginView(self)
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
      
   
    }
    
    override func loadView() {
        loginView.presenter = presenter
        view = loginView
    }

}


extension LoginViewController : PresenterToViewLoginProtocol {
    
}


#Preview {
    LoginViewController()
}




