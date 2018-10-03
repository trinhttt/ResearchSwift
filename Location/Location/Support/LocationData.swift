//
//  LocationData.swift
//  Location
//
//  Created by Thai Thi Tu Trinh on 9/27/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation

class LocationData{
    var locationId: String = ""
    var locationDescription: String = ""
    var mainText: String = ""
    var secondary_text: String = ""
    
    func map(inputData: [String: Any]) {
        locationId = inputData["place_id"] as! String
        locationDescription = inputData["description"] as! String
        
        let structureFormatting = inputData["structured_formatting"] as? [String: Any]
        mainText = structureFormatting!["main_text"] as! String
        
        let secondaryTmp = structureFormatting!["secondary_text"] as? String
        
        if secondaryTmp == nil {
            secondary_text = ""
        } else {
            secondary_text = secondaryTmp!
        }
    }
    
}
