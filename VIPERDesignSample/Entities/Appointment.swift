//
//  Appointment.swift
//  VIPERDesignSample
//
//  Created by Swayambhu Jyoti Banerjee on 2/13/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class Appointment: BaseModel {
    
    var appointmentType : String = ""
    var date : String = ""
    
    init(claimantName: String, description: String, appointmentType: String, date: String) {
        super.init(claimantName: claimantName, description: description)
        self.appointmentType = appointmentType
        self.date = date
    }
}
