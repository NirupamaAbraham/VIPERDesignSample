//
//  LoginPresenter.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class LoginPresenter: LoginViewToPresenterProtocol {
    
    weak var view: LoginPresenterToViewProtocol?
    var interactor: LoginPresenterToInteractorProtocol?
    var router: LoginPresenterToRouterProtocol?
    
    func login(withUserName userName: String, andPassword password: String) {
        interactor?.authenticate(userName, password: password)
    }
}

extension LoginPresenter: LoginInteractorToPresenterProtocol {
    func authenticationSuccessful() {
        router?.showActivityModule(from: view!)
    }
    
    func authenticationFailed(withError error: NSError) {
        view?.loginFailed(withError: error)
    }
}
