//
//  CommonTableViewCell.swift
//  VIPERDesignSample
//
//  Created by Swayambhu Jyoti Banerjee on 2/13/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import UIKit

class CommonTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureClaimCell(activity:Claim)
    {
        nameLabel.text = activity.claimantName
        titleLabel.text = activity.claimFileNumber
       
        
    }
    
    func configureAppointmentCell(activity : Appointment) {
        nameLabel.text = activity.appointmentType
        titleLabel.text = activity.date
    }

}
