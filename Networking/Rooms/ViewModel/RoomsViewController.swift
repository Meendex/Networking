//
//  ViewController.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 26/08/2022.
//

import UIKit

class RoomsViewController: UIViewController {
    var roomViewModel: RoomViewModel?
    weak var coordinator: AppCoordinator?

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        Task {
            await roomViewModel?.getRoomsAsync()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
//        roomViewModel.dataDidReceived = {
//            DispatchQueue.main.async {self.tableView.reloadData()
//            }
//    }
//        roomViewModel.RoomsData()
//        networkManager.networkDelegate = self
//        networkManager.getRooms()
    }
}
extension RoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if let rooms = roomViewModel.rooms {
        return roomViewModel?.roomsRecordCount ?? 0
//    }
//        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if roomViewModel != nil {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RoomTableViewCell else {
            return UITableViewCell()
        }
            if let room = roomViewModel?.getRoom(index: indexPath.row){
            cell.updateData(with: room)
        }
                return cell
    }
    return UITableViewCell()
    }
}
/*extension ViewController: ViewContract {
    func setRooms(rooms:[Rooms]){
        self.rooms = rooms
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

protocol ViewContract {
    func setRooms(rooms:[Rooms])
}*/
