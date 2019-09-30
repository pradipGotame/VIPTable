//
//  Worker.swift
//  VipTable
//
//  Created by Pradip Gotame on 9/27/19.
//  Copyright © 2019 Pradip Gotame. All rights reserved.
//

import Foundation

protocol WorkerProtocol {
    func readJsonFile(completion: (JsonParsingResponse.Worker?,String) -> ())
}

class Workers: WorkerProtocol, CodableProtocol {
    func readJsonFile( completion: (JsonParsingResponse.Worker?,String) -> ()){
        if let path = Bundle.main.path(forResource: "sample", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let model = self.decode(JsonParsingResponse.Worker.self, from: data)
                completion(model,"success")
            } catch let error {
                completion(nil,"parse error: \(error.localizedDescription)")
            }
        } else {
            
            completion(nil,"Invalid filename/path.")
        }
    }
}
