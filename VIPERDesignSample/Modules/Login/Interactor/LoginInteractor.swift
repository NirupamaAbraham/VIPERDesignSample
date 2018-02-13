//
//  LoginInteractor.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class LoginInteractor: LoginPresenterToInteractorProtocol {
    
    weak var presenter: LoginInteractorToPresenterProtocol?
    
    func authenticate(_ username: String, password: String) {
        Request.authentication().execute().validate().responseJSON {
            (urlRequest, urlResponse, json, error) -> Void in
            guard error == nil else {
                self.presenter?.authenticationFailed(withError: error!)
                return
            }
            guard let retrievedUsername = json["username"] as? String, let retrievedPassword = json["password"] as? String else {
                let err = NSError(domain: "Authentication error", code: 401, userInfo: nil)
                self.presenter?.authenticationFailed(withError: err)
                return
            }
            if retrievedUsername == username && retrievedPassword == password {
                self.presenter?.authenticationSuccessful()
            }
            else {
                let err = NSError(domain: "Username or password incorrect", code: 401, userInfo: nil)
                self.presenter?.authenticationFailed(withError: err)
            }
        }
    }
}
