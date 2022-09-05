//
//  RoomViewModel.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 05/09/2022.
//

import Foundation

class RoomViewModel {
    private let networkManager: RoomsNetworkManager
    var rooms: [Rooms]?
    var dataDidReceived: (() -> Void)?
    init (){
        networkManager = RoomsNetworkManager()
    }
    func RoomsData() {
        networkManager.getRooms(callback: {result in
            switch result {
        case .success(let rooms): self.rooms = rooms
        case .failure: self.rooms = []
        }
        self.dataDidReceived?()
        })
    }
}
