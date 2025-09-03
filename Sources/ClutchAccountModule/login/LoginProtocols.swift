//
//  AccountProtocols.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//


import Foundation
import UIKit
import ClutchViewControllerAbleKit

typealias Kits = UIViewAble & SegueAble  & NavigationDesing

protocol ViewToPresenterLoginProtocol {
    var view : PresenterToViewLoginProtocol? {get}
    func viewDidLoad()
}



protocol PresenterToViewLoginProtocol : AnyObject,Kits {
    
}


protocol PresenterToInteractorLoginProtocol {
    
}


protocol InteractorToPresenterLoginProtocol {
    
}


public protocol LoginRouterProtocol {
    func createViewController() -> UIViewController
}
