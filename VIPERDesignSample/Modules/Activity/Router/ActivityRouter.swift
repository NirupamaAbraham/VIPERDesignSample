//
//  ActivityRouter.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation
import UIKit

class ActivityRouter : ActivityPresenterToRouterProtocol {
    class func createActivityModule() -> UIViewController {
        let activityStoryBoard = UIStoryboard(name: "Activity", bundle: nil)
        
        let navController = activityStoryBoard.instantiateViewController(withIdentifier: "ActivitiesNavigationController")
        
        if let view = navController.childViewControllers.first as? ActivityPresenterTableViewController {
            
            let presenter : ActivityViewToPresenterProtocol & ActivityInterectorToPresenterProtocol = ActivityPresenter()
            let interactor : ActivityPresentorToInterectorProtocol = ActivityInteractor()
            let wireFrame : ActivityPresenterToRouterProtocol = ActivityRouter()
            
            view.presenter = presenter
            presenter.view = view
            interactor.presenter = presenter
            presenter.interactor = interactor
            presenter.wireframe = wireFrame
            
            return navController
        }
        return UIViewController()
    }
    
    func showDetailView(forActivity activity: Activities, inView view: UIViewController) {
        if let detailVC = DetailRouter.createDetailModule(forActivity: activity) {
            view.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func showLoginScreen(view: UIViewController) {
        if view.childViewControllers.count > 0{
            let viewControllers:[UIViewController] = view.childViewControllers
            for viewContoller in viewControllers{
                viewContoller.willMove(toParentViewController: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParentViewController()
            }
        }
        guard let parentView = view.parent else { return }
        
        if parentView.childViewControllers.count > 0 {
            let viewControllers:[UIViewController] = parentView.childViewControllers
            for viewContoller in viewControllers{
                viewContoller.willMove(toParentViewController: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParentViewController()
            }
            
        }
    }
}
