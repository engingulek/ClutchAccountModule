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

protocol ViewToPresenterAccontProtocol {
    var view : PresenterToViewAccountProtocol? {get}
    func viewDidLoad()
}



protocol PresenterToViewAccountProtocol : AnyObject,Kits {
    
}


protocol PresenterToInteractorAccountProtocol {
    
}


protocol InteractorToPresenterAccountProtocol {
    
}


public protocol AccountRouterProtocol {
    func createViewController() -> UIViewController
}
