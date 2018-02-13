//
//  Claim.swift
//  VIPERDesignSample
//
//  Created by Swayambhu Jyoti Banerjee on 2/13/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class Claim : Activities {
    
    var claimFileNumber : String = ""
    var peril : String = ""
    
    init(claimantName: String, description: String, claimFileNumber: String, peril: String) {
        super.init(claimantName: claimantName, description: description)
        self.claimFileNumber = claimFileNumber
        self.peril = peril
    }
}
