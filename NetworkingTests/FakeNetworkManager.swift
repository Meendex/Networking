//
//  FakeNetworkManager.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 05/09/2022.
//

import Foundation
//@testable import Networking
class FakeNetworkManager{
    func getData(callback: @escaping ([Rooms]?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "", withExtension: "") {
            do {
                let data = try Data(contentsOf: url)
                let parsedData = try JSONDecoder().decode([Rooms].self, from: data)
                callback(parsedData, nil)
            } catch {
                print("Error")
                callback(nil, error)
            }
        }
    }
}
