//
//  DetailViewController.swift
//  VIPERDesignSample
//
//  Created by Nirupama M Abraham on 14/02/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import UIKit

protocol DetailModel {
    var nameTuple: (title: String, subTitle: String) { get }
    var claimantNameTuple: (title: String, subTitle: String) { get }
    var detailTuple: (title: String, subTitle: String) { get }
    var descTuple: (title: String, subTitle: String) { get }
    var navigationTitle : String { get }
}

enum DetailViewModel {
    case claim(Activities)
    case appointment(Activities)
}

extension DetailViewModel: DetailModel {
    
    var nameTuple: (title: String, subTitle: String) {
        var title = ""
        var subTitle = ""
        switch self {
        case .claim(let activity):
            if let claim = activity as? Claim {
                title = "Claim File Number"
                subTitle = claim.claimFileNumber
            }
        case .appointment(let activity):
            if let appointment = activity as? Appointment {
                title = "Appointment Type"
                subTitle = appointment.appointmentType
            }
        }
        return (title, subTitle)
    }
    var claimantNameTuple: (title: String, subTitle: String) {
        let title = "Claimant Name"
        var subTitle = ""
        switch self {
        case .claim(let activity):
            subTitle = activity.claimantName
        case .appointment(let activity):
            subTitle = activity.claimantName
        }
        return (title, subTitle)
    }
    var detailTuple: (title: String, subTitle: String) {
        var title = ""
        var subTitle = ""
        switch self {
        case .claim(let activity):
            if let claim = activity as? Claim {
                title = "Peril"
                subTitle = claim.peril
            }
        case .appointment(let activity):
            if let appointment = activity as? Appointment {
                title = "Date"
                subTitle = appointment.date
            }
        }
        return (title, subTitle)
    }
    var descTuple: (title: String, subTitle: String) {
        let title = "Description"
        var subTitle = ""
        switch self {
        case .claim(let activity):
            subTitle = activity.descriptionString
        case .appointment(let activity):
            subTitle = activity.descriptionString
        }
        return (title, subTitle)
    }
    
    var navigationTitle : String {
        var navigationTitle = ""
       
        switch self {
        case .claim(let activity):
             if let claim = activity as? Claim {
             navigationTitle = "ClaimFileNumber " + claim.claimFileNumber
            }
        case .appointment( _):
            navigationTitle = "Appointment"
            
        }
        return navigationTitle
    }
}

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var nameSubtitleLabel: UILabel!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailSubtitleLabel: UILabel!
    @IBOutlet weak var claimantNameTitleLabel: UILabel!
    @IBOutlet weak var claimantNameSubtitleLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionSubtitleLabel: UILabel!
    
    var presenter: DetailViewToPresenterProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter?.getDetails()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension DetailViewController: DetailPresenterToViewProtocol {
    func showDetails(forModel model: DetailViewModel?) {
       
        if let model = model {
            self.navigationItem.title = model.navigationTitle
            self.nameTitleLabel.text = model.nameTuple.title
            self.nameSubtitleLabel.text = model.nameTuple.subTitle
            self.detailTitleLabel.text = model.detailTuple.title
            self.detailSubtitleLabel.text = model.detailTuple.subTitle
            self.claimantNameTitleLabel.text = model.claimantNameTuple.title
            self.claimantNameSubtitleLabel.text = model.claimantNameTuple.subTitle
            self.descriptionTitleLabel.text = model.descTuple.title
            self.descriptionSubtitleLabel.text = model.descTuple.subTitle

        }
    }
}
