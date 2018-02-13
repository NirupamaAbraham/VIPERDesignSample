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
    func showLoading()
    func hideLoading()
}

protocol ActivityInterectorToPresenterProtocol: class {
    
    func claimsFetched()
    func activitiesFetched()
    func claimsFetchFailed()
    func activitiesFetchFailed()
}

protocol ActivityPresentorToInterectorProtocol: class {
    var presenter: ActivityInterectorToPresenterProtocol? { get set }
     func getActivities()
}

protocol ActivityViewToPresenterProtocol: class {
    var view : ActivityPresenterToViewProtocol? { get set }
    var interactor : ActivityPresentorToInterectorProtocol? { get set }
    var router : ActivityPresenterToRouterProtocol? { get set }
    func loadActivities()
}

protocol ActivityPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}


