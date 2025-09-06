//
//  SingUpViewController.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 6.09.2025.
//

import Foundation
import UIKit
import SnapKit
import ClutchCoreKit

class SingUpViewController : UIViewController {
    
    private lazy var singUpView =  SingUpView(self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
    }
    
    
    override func loadView() {
        view = singUpView
    }
    
    
    func setText() {
        let text = TextState()
        singUpView.getText(text)
    }
}


#Preview {
    SingUpViewController()
}




