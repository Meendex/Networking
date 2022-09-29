//
//  RoomViewModelTests.swift
//  NetworkingTests
//
//  Created by Mindaugas Balakauskas on 29/09/2022.
//

import XCTest
@testable import Networking

class RoomViewModelTests: XCTestCase {

    let networkManager = FakeNetworkManager()
    var viewModel: RoomViewModel!
    
    override func setUpWithError() throws {
        viewModel = RoomViewModel(networkManager: RoomsNetworkManager())
    }
    override func tearDownWithError() throws {
  
    }

    func testGetRoomsAsync() async {
        var roomsCount = viewModel.roomsRecordCount
        XCTAssertEqual(0, roomsCount)
        await viewModel.getRoomsAsync()
        roomsCount = viewModel.roomsRecordCount
        XCTAssertEqual(65, roomsCount)
    }
}
