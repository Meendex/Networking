//
//  NetworkManager.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 30/08/2022.
//

import Foundation

class NetworkManager {
    
    //var networkDelegate: ViewContract?
    func getRooms(callback: @escaping([Rooms]?, Error?) -> Void) {
        let urlSession = URLSession.shared
        
        guard let url = URL(string: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms") else {
            return
        }
        let dataTask = urlSession.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            let jsonDecorder = JSONDecoder()
            do {
              let rooms = try
                jsonDecorder.decode([Rooms].self, from: data)
                callback(rooms, nil)
                //self.networkDelegate?.setRooms(rooms: rooms)
            }catch {
                print(error)
            }
        }
        dataTask.resume()
    }

}
