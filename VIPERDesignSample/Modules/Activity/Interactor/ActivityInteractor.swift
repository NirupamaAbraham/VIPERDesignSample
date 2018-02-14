//
//  ActivityInteractor.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class ActivityInteractor : ActivityPresentorToInterectorProtocol {
    
    weak var presenter: ActivityInterectorToPresenterProtocol?
    
    func getActivities() {
        Request.getClaimFiles().execute().validate().responseJSON {
            (urlRequest, urlResponse, json, error) -> Void in
            
            guard error == nil else {
                self.presenter?.claimsFetchFailed(withError: error!)
                return
            }
            let claimFileArray = json["response"]

            let claimData : [Claim] = claimFileArray.map({
                return Claim(claimantName: $0["claimantName"].stringValue, description: $0["claimDescription"].stringValue, claimFileNumber: $0["claimFileNumber"].stringValue, peril: $0["peril"].stringValue)
            })
            self.presenter?.claimsFetched(claimData:claimData)
            
    }
        
        Request.getAppointments().execute().validate().responseJSON {
            (urlRequest, urlResponse, json, error) -> Void in
            
            guard error == nil else {
                self.presenter?.appointmentsFetchedFailed(withError: error!)
                return
            }
            
            let appointmentArray = json["response"]
            let appointmentData : [Appointment] = appointmentArray.map({
                return Appointment(claimantName: $0["claimantName"].stringValue, description: $0["description"].stringValue, appointmentType: $0["appointmentType"].stringValue, date: $0["date"].stringValue)
                
            })
                
            self.presenter?.appointmentsFetched(appointmentData: appointmentData)
            
        }
    }
}
