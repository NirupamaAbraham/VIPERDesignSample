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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var peril_timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(activity:Claim)
    {
        nameLabel.text = activity.claimantName
        descriptionLabel.text = activity.descriptionString
        titleLabel.text = activity.claimFileNumber
        peril_timeLabel.text = activity.peril
//        if activity is Claim {
//
//        } else {
//
//        }
        
    }

}
