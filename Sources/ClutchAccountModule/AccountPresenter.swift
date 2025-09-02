//
//  AccountPresenter.swift
//  ClutchAccountModule
//
//  Created by Engin Gülek on 2.09.2025.
//

final class AccountPresenter {
    weak var view : PresenterToViewAccountProtocol?
    
    init(view: PresenterToViewAccountProtocol?) {
        self.view = view
    }
    
}


extension AccountPresenter : ViewToPresenterAccontProtocol {
    func viewDidLoad() {
        
    }
    
    
}
