//
//  FakeNetworkManager.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 05/09/2022.
//

import Foundation
@testable import Networking

class FakeNetworkManager: NetworkManagerActions {
    func getRoomsAsync() async throws -> [Rooms] {
        guard let url = Bundle.main.url(forResource: "Rooms", withExtension: "json") else {
            throw NetworkError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let rooms = try JSONDecoder().decode([Rooms].self, from: data)
            return rooms
        } catch {
            throw NetworkError.parsingFailed
        }
    }
    
    func getRoomsClosure(callback: @escaping (Result<[Rooms], NetworkError>) -> Void) {
        let urlSession = URLSession.shared
        guard let url = Bundle.main.url(forResource: "Rooms", withExtension: "json") else {callback(.failure(NetworkError.invalidURL))
            return
        }
        let dataTask = urlSession.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                callback(.failure(NetworkError.dataNotFound))
                return
            }
            let jsonDecorder = JSONDecoder()
            do {
                let rooms = try jsonDecorder.decode([Rooms].self, from: data)
                callback(.success(rooms))
            } catch {
                callback(.failure(NetworkError.parsingFailed))
            }
        }
        dataTask.resume()
    }
}
