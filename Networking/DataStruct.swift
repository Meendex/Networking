//
//  DataStruct.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 26/08/2022.
//

import Foundation

struct DataStruct: Decodable {
    let createdAt: String
    let isOccupied: Bool
    let maxOcupancy: Int
    let id: String
    
}
