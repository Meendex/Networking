//
//  RoomViewModel.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 05/09/2022.
//

import Foundation

protocol RoomsViewModelIn {
    func getRoomsAsync() async
    func getRoomsClosure()
}
protocol RoomsViewModelOut {
    var roomsRecordCount: Int {get}
    func getRoom(index: Int) -> Rooms
}

class RoomViewModel {
    private let networkManager: RoomsNetworkManager
    private var rooms: [Rooms] = []
    //var dataDidReceived: (() -> Void)?
    init (networkManager: RoomsNetworkManager){
        self.networkManager = networkManager
    }
////    func RoomsData() {
////        networkManager.getRooms(callback: {result in
////            switch result {
////        case .success(let rooms): self.rooms = rooms
////        case .failure: self.rooms = []
////        }
////        self.dataDidReceived?()
////        })
//    }
}
extension RoomViewModel: RoomsViewModelIn {
    
    func getRoomsClosure() {
        networkManager.getRoomsClosure(callback: {[weak self] result in
            switch result {
            case .success(let rooms):
                self?.rooms = rooms
            case .failure:
                self?.rooms = []
            }
        })
    }
    func getRoomsAsync() async {
        do {
            rooms = try await networkManager.getRoomsAsync()
        } catch {
            print(error)
            
        }
    }
}
extension RoomViewModel: RoomsViewModelOut {
    var roomsRecordCount: Int { return rooms.count}
    func getRoom(index: Int) -> Rooms { return rooms[index]}
}
