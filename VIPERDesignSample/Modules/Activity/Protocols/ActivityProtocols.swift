//
//  ActivityProtocols.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation
import UIKit

protocol ActivityPresenterToViewProtocol: class {
    func showClaim(claimArray : [Claim])
    func showAppointment(appointmentArray: [Appointment])
//    func showLoading()
//    func hideLoading()
}

protocol ActivityInterectorToPresenterProtocol: class {
    
    func claimsFetched(claimData: [Claim])
    func appointmentsFetched(appointmentData: [Appointment])
    func claimsFetchFailed(withError error: NSError)
    func appointmentsFetchedFailed(withError error: NSError)
}

protocol ActivityPresentorToInterectorProtocol: class {
    var presenter: ActivityInterectorToPresenterProtocol? { get set }
     func getActivities()
}

protocol ActivityViewToPresenterProtocol: class {
    var view : ActivityPresenterToViewProtocol? { get set }
    var interactor : ActivityPresentorToInterectorProtocol? { get set }
    var wireframe : ActivityPresenterToRouterProtocol? { get set }
    
    func loadActivities()
    func showActivityDetail(forActivity activity: Activities)
}

protocol ActivityPresenterToRouterProtocol: class{
    static func createActivityModule() -> UIViewController
    func showDetailView(forActivity activity: Activities, inView view: UIViewController)
}


