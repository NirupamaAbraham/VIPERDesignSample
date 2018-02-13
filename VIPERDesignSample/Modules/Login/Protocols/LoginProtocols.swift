//
//  LoginProtocols.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewToPresenterProtocol: class {
    var view: LoginPresenterToViewProtocol? { get set }
    var router: LoginPresenterToRouterProtocol? { get set }
    func login(withUserName userName: String, andPassword password: String)
}

protocol LoginPresenterToViewProtocol: class {
    var presenter: LoginViewToPresenterProtocol? { get set }
    func loginFailed(withError error: NSError)
}

protocol LoginPresenterToInteractorProtocol: class {
    var presenter: LoginInteractorToPresenterProtocol? { get set }
    func authenticate(_ username: String, password: String)
}

protocol LoginInteractorToPresenterProtocol: class {
    var interactor: LoginPresenterToInteractorProtocol? { get set }
    func authenticationSuccessful()
    func authenticationFailed(withError error: NSError)
}

protocol LoginPresenterToRouterProtocol: class {
    static func createLoginModule() -> UIViewController?
    func showActivityModule()
}
