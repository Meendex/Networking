//
//  NetworkManager.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 30/08/2022.
//

import Foundation

protocol NetworkManagerActions {
    func getRoomsAsync()async throws -> [Rooms]
    func getRoomsClosure(callback: @escaping (Result<[Rooms], NetworkError>) -> Void)
}
enum NetworkError: Error {
    case invalidURL
    case dataNotFound
    case parsingFailed
}
class RoomsNetworkManager: NetworkManagerActions {
    let roomsURL: String = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms"
    func getRoomsAsync()async throws -> [Rooms] {
        guard let url = URL(string: roomsURL) else {
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
        guard let url = URL(string: roomsURL) else {callback(.failure(NetworkError.invalidURL))
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
