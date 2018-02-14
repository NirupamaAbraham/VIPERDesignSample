//
//  AppointmentRouter.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: DetailPresenterToRouterProtocol {
    class func createDetailModule(forActivity activity: Activities) -> UIViewController? {
        let view = DetailViewController(nibName: "DetailViewController", bundle: nil)
        let presenter: DetailViewToPresenterProtocol = DetailPresenter()
        let router: DetailPresenterToRouterProtocol = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.activity = activity
        
        return view
    }
}
