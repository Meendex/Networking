//
//  ViewController.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 26/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let networkManager = NetworkManager()
    var rooms: [Rooms]?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        networkManager.networkDelegate = self
        networkManager.getRooms()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        if let roomData = rooms?[indexPath.row] {

            cell.createAtLabel.text = roomData.createdAt
            cell.OccupiedLabel.text = String(roomData.isOccupied)
            cell.maxOccupancyLabel.text = String(roomData.maxOccupancy)
            cell.idLabel.text = roomData.id
        }
        return cell
    }
}

extension ViewController: ViewContract {
    func setRooms(rooms:[Rooms]){
        self.rooms = rooms
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

protocol ViewContract {
    func setRooms(rooms:[Rooms])
}
