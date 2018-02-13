//
//  LoginInteractor.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation
import AKNetworking

class LoginInteractor: LoginPresenterToInteractorProtocol {
    
    weak var presenter: LoginInteractorToPresenterProtocol?
    
    func authenticate(_ username: String, password: String) {
        Request.authentication(username: username, password: password).execute().validate().responseJSON {
            (urlRequest, urlResponse, json, error) -> Void in
            guard error == nil else {
                self.presenter?.authenticationFailed(withError: error!)
                return
            }
            let response = json["response"] as JSON
            guard let retrievedUsername = response["username"].string, let retrievedPassword = response["password"].string else {
                let err = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("Authentication error", comment: "")])
                self.presenter?.authenticationFailed(withError: err)
                return
            }
            if retrievedUsername == username && retrievedPassword == password {
                self.presenter?.authenticationSuccessful()
            }
            else {
                let err = NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("Username or password incorrect", comment: "")])
                self.presenter?.authenticationFailed(withError: err)
            }
        }
    }
}
