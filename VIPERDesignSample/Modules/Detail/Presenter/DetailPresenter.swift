//
//  DetailPresenter.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 14/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class DetailPresenter: DetailViewToPresenterProtocol {
    
    weak var view: DetailPresenterToViewProtocol?
    var router: DetailPresenterToRouterProtocol?
    var activity: Activities?
    
    func getDetails() {
        self.createDetailViewModel()
    }
    
    func createDetailViewModel() {
        var detailModel: DetailViewModel?
        if let activity = self.activity {
            if let model = activity as? Appointment {
                detailModel = DetailViewModel.appointment(activity)
            }
            else if let model = activity as? Claim {
                detailModel = DetailViewModel.claim(activity)
            }
            self.view?.showDetails(forModel: detailModel)
        }
    }
}
