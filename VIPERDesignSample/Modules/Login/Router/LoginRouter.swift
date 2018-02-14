//
//  LoginRouter.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation
import UIKit

class LoginRouter: LoginPresenterToRouterProtocol {
    
    class func createLoginModule() -> UIViewController? {
        let loginStoryBoard = UIStoryboard(name: "Login", bundle: nil)
        if let view = loginStoryBoard.instantiateInitialViewController() as? LoginViewController {
            let presenter: LoginViewToPresenterProtocol & LoginInteractorToPresenterProtocol = LoginPresenter()
            let interactor: LoginPresenterToInteractorProtocol = LoginInteractor()
            let router: LoginPresenterToRouterProtocol = LoginRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            interactor.presenter = presenter
            presenter.router = router
            
            return view
        }
        return nil
    }
    
    func showActivityModule(from view: LoginPresenterToViewProtocol) {
        
        let activityNavigationVC = ActivityRouter.createActivityModule()
        
        if let sourceView = view as? UIViewController, let activityVC = activityNavigationVC.childViewControllers.first {
            
            sourceView.addChildViewController(activityVC)
            sourceView.view.addSubview(activityVC.view)
            activityVC.didMove(toParentViewController: sourceView)

        }
    }
    
   
}
