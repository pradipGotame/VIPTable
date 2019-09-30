//
//  Interactor.swift
//  VipTable
//
//  Created by Pradip Gotame on 9/27/19.
//  Copyright © 2019 Pradip Gotame. All rights reserved.
//

import Foundation

protocol InteractorBusinessLogicProtocol {
    func parsedData()
    func clickedData(value: String)
}

protocol InteractorDataSource {
    var data: String? { get set }
}

class Interactor: InteractorBusinessLogicProtocol, InteractorDataSource {
    
    var presnter: PresenterPresentationLogic?
    
    private var _worker = Workers()
    
    var data: String?
    
    func parsedData() {
        _worker.readJsonFile { (worker, error) in
            guard let model = worker else { return }
            presnter?.displayDataInTable(data: model.data!)
        }
    }
    
    func clickedData(value: String) {
        data = value
        
    }
}
