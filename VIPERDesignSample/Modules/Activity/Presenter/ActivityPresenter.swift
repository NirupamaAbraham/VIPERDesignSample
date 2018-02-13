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
    
    func showActivityDetail(forPost activity: Activities) {
        
    }
    
    
    func loadActivities() {
        interactor?.getActivities()
    }
    
}

extension ActivityPresenter : ActivityInterectorToPresenterProtocol {
    
    func claimsFetched(claimData: [Claim]) {
        view?.showClaim(claimArray: claimData)
    }
    
    func claimsFetchFailed(withError error: NSError) {
        
    }
    
    func appointmentsFetched() {
        
    }
    
    func appointmentsFetchedFailed(withError error: NSError) {
        
    }
    
    
    
}
