//
//  NetworkManager.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 30/08/2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case dataNotFound
    case parsingFailed
}
class RoomsNetworkManager {
    let roomsURL: String = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms"
    //var networkDelegate: ViewContract?
    
    func getRooms(callback: @escaping(Result<[Rooms], Error>) -> Void) {
        let urlSession = URLSession.shared
        
        guard let url = URL(string: roomsURL) else {
            callback(.failure(NetworkError.invalidURL))
            return
        }
        let dataTask = urlSession.dataTask(with: url) { data, response, error in
            guard let data = data else {
                callback(.failure(NetworkError.dataNotFound))
                return
            }
            let jsonDecorder = JSONDecoder()
            do {
              let rooms = try
                jsonDecorder.decode([Rooms].self, from: data)
                callback(.success(rooms))
                //self.networkDelegate?.setRooms(rooms: rooms)
            }catch {
                callback(.failure(NetworkError.parsingFailed))
            }
        }
        dataTask.resume()
    }

}
