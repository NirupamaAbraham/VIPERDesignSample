//
//  ActivityPresenter.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class ActivityPresenter : ActivityViewToPresenterProtocol {
    
    var view: ActivityPresenterToViewProtocol?
    var interactor: ActivityPresentorToInterectorProtocol?
    var wireframe: ActivityPresenterToRouterProtocol?
    
    func showActivityDetail(forActivity activity: Activities) {
        if let view = self.view as? ActivityPresenterTableViewController {
            self.wireframe?.showDetailView(forActivity: activity, inView: view)
        }
    }
    
    
    func loadActivities() {
        interactor?.getActivities()
    }
    
}

extension ActivityPresenter : ActivityInterectorToPresenterProtocol {
    
    
    
    func claimsFetched(claimData: [Claim]) {
        view?.showClaim(claimArray: claimData)
    }
    
    func appointmentsFetched(appointmentData: [Appointment]) {
        view?.showAppointment(appointmentArray: appointmentData)
    }
    
    func claimsFetchFailed(withError error: NSError) {
        
    }

    
    func appointmentsFetchedFailed(withError error: NSError) {
        
    }
    
    
    
}
