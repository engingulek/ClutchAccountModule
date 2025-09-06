//
//  SingUpProtocols.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 6.09.2025.
//

import Foundation
import UIKit
import ClutchViewControllerAbleKit

typealias SingUpKits = UIViewAble & SegueAble  & NavigationDesing

struct SingUpData {
    let firstName:String
    let lastName:String
    let email:String
    let password:String
}


protocol ViewToPresenterSingUpProtocol {
    var view : PresenterToViewSingUpProtocol? {get}
    func viewDidLoad()
    
    
    func onTappedGoogleButton()
    func onTappedAppleButton()
    
    func onChangedFirstNameTextField(text:String?)
    func onChangedLastNameTextField(text:String?)
    func onChangedEmailTextField(text:String?)
    func onChangedPasswordTextField(text:String?)
    func onTappedSingUpButton()
    
    
 
    
}



protocol PresenterToViewSingUpProtocol : AnyObject,LoginKits {
    func sendTextState(text:TextState)
}


protocol PresenterToInteractorSingUpProtocol {
    func singUpEmailAndPassword(data : SingUpData)
}


protocol InteractorToPresenterSingUpProtocol {
    func singUpResult()

}

protocol PresenterToRouterSingUpProtocol {
    
}


