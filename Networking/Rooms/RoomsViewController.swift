//
//  ViewController.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 26/08/2022.
//

import UIKit

class RoomsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var roomViewModel = RoomViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        roomViewModel.dataDidReceived = {
            DispatchQueue.main.async {self.tableView.reloadData()
            }
    }
        roomViewModel.RoomsData()
        //networkManager.networkDelegate = self
        //networkManager.getRooms()
    }
}
extension RoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rooms = roomViewModel.rooms {
        return rooms.count
    }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if roomViewModel.rooms != nil {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RoomTableViewCell else {
            return UITableViewCell()
        }
        if let room = roomViewModel.rooms?[indexPath.row] {
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
