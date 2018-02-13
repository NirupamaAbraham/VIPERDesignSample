//
//  ActivityInteractor.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 09/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class ActivityInteractor : ActivityPresentorToInterectorProtocol {
    
    var presenter: ActivityInterectorToPresenterProtocol?
    
    func getActivities() {
        Request.getClaimFiles().execute().validate().responseJSON {
            (urlRequest, urlResponse, json, error) -> Void in
            
            guard error == nil else {
                self.presenter?.claimsFetchFailed(withError: error!)
                return
            }
            let claimFileArray = json["response"]
            var claimData : [Claim] = []
           /* let postModelList = postList.map() {
                return PostModel(id: Int($0.id), title: $0.title!, imageUrl: $0.imageUrl!, thumbImageUrl: $0.thumbImageUrl!)
            }*/
            for claim in claimFileArray {
                claimData.append(Claim(claimantName: claim["claimantName"].stringValue, description: claim["description"].stringValue, claimFileNumber: claim["claimFileNumber"].stringValue, peril: claim["peril"].stringValue))
            }
            
            self.presenter?.claimsFetched(claimData:claimData)
            
    }
    }
}
