//
//  Router.swift
//  VipTable
//
//  Created by Pradip Gotame on 9/27/19.
//  Copyright © 2019 Pradip Gotame. All rights reserved.
//

import Foundation

@objc protocol RoutingLogic {
    func routeToSecondView()
}

protocol RoutingDataPassing {
    var name: String? { get set }
}

class Router: NSObject, RoutingLogic, RoutingDataPassing {
    var name: String?
    
    weak var controller: ViewController?
    
    func routeToSecondView() {
        
    }
}
