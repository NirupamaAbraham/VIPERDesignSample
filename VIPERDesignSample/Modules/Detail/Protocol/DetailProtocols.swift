//
//  DetailProtocols.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 14/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation
import UIKit
protocol DetailViewToPresenterProtocol: class {
    var view: DetailPresenterToViewProtocol? { get set }
    var router: DetailPresenterToRouterProtocol? { get set }
    var activity: Activities? { get set }
    func getDetails()
}

protocol DetailPresenterToViewProtocol: class {
    var presenter: DetailViewToPresenterProtocol? { get set }
    func showDetails(forModel model: DetailViewModel?)
}

protocol DetailPresenterToRouterProtocol: class {
    static func createDetailModule(forActivity activity: Activities) -> UIViewController?
}
