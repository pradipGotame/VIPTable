//
//  Presentor.swift
//  VipTable
//
//  Created by Pradip Gotame on 9/27/19.
//  Copyright © 2019 Pradip Gotame. All rights reserved.
//

import Foundation

// Data is converted in viewmodel here

protocol PresenterPresentationLogic {
    func displayDataInTable(data: [JsonParsingResponse.Datum])
    func clickedResponse(model: Response.ViewModel)
}

class Presentor: PresenterPresentationLogic {
    weak var controller: MainDisplayLogic?
    
    func displayDataInTable(data: [JsonParsingResponse.Datum]) {
        controller?.reload(data: data)
    }
    
    func clickedResponse(model: Response.ViewModel) {
        
    }
}
