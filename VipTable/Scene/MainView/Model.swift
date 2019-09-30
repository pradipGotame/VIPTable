//
//  Model.swift
//  VipTable
//
//  Created by Pradip Gotame on 9/27/19.
//  Copyright © 2019 Pradip Gotame. All rights reserved.
//

import Foundation


enum JsonParsingResponse {
    
    struct Worker: Codable {
        let data: [Datum]?
    }
    
    struct Datum: Codable {
        let type, id: String?
        let attributes: Attributes?
        let relationships: Relationships?
    }
    
    struct Attributes: Codable {
        let title, body, created, updated: String?
    }
    
    struct Relationships: Codable {
        let author: Author?
    }
    
    struct Author: Codable {
        let data: DataClass?
    }
    
    
    struct DataClass: Codable {
        let id, type: String?
    }
}

enum Response {
    struct ViewModel {
        let title: String
    }
}


