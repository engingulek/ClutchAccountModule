//
//  BaseView.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 3.09.2025.
//

import UIKit

class BaseView<T: UIViewController>: UIView {
   weak var controller: T?

    init(_ controller: T) {
        self.controller = controller
        super.init(frame: .zero)
      
        setupView()
    }
    
    

    func setupView() { }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
