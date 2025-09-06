//
//  AccountProtocols.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//


import Foundation
import UIKit
import ClutchViewControllerAbleKit

typealias LoginKits = UIViewAble & SegueAble  & NavigationDesing


enum LoginResult {
    case success(String)
    case failure(LoginError)
}

enum LoginError {
    case noneEmail
    case wrongEmailOrPassword
}

protocol ViewToPresenterLoginProtocol {
    var view : PresenterToViewLoginProtocol? {get}
    func viewDidLoad()
    
    func onTappedGoogleButton()
    func onTappedAppleButton()
    func onChangedEmailTextField(text:String?)
    func onChangedPasswordTextField(text:String?)
    func onTappedSingUpButton()
    func onTappedLoginButton()
    
}



protocol PresenterToViewLoginProtocol : AnyObject,LoginKits {
    func sendTextState(text:TextState)
}


protocol PresenterToInteractorLoginProtocol {
    func loginEmailAndPassword(email:String,password:String)
}


protocol InteractorToPresenterLoginProtocol {
    func loginResult(result:LoginResult)

}

protocol PresenterToRouterLoginProtocol {
    func toSingUpScreen(view:PresenterToViewLoginProtocol?)
}

