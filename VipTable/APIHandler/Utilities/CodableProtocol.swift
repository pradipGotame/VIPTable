//
//  CodableProtocol.swift
//  VipTable
//
//  Created by Pradip Gotame on 9/27/19.
//  Copyright © 2019 Pradip Gotame. All rights reserved.
//

import Foundation

protocol CodableProtocol {
    func decode<T>(_ type: T.Type, from data: Data) -> T where T : Decodable
    func encode<T>(_ value: T) -> Data where T : Encodable
}

extension CodableProtocol {
    func decode<T>(_ type: T.Type, from data: Data) -> T where T : Decodable{
        do {
            return try! JSONDecoder().decode(T.self, from: data)
        }
    }
    
    func encode<T>(_ value: T) -> Data where T : Encodable {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            return try! encoder.encode(value)
        }
    }
}
