//
//  Rooms.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 30/08/2022.
//

import Foundation

struct Rooms: Decodable {
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Int
    let id: String
}
