//
//  BaseModel.swift
//  VIPERDesignSample
//
//  Created by Swayambhu Jyoti Banerjee on 2/13/18.
//  Copyright © 2018 Nirupama M Abraham. All rights reserved.
//

import Foundation

class Activities : NSObject {
    
    var claimantName : String = ""
    var descriptionString : String = ""
    
     init(claimantName: String, description: String) {
        self.claimantName = claimantName
        self.descriptionString = description
    }
}
