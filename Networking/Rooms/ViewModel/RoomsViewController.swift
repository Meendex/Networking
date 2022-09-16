//
//  ViewController.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 26/08/2022.
//
import Foundation
import UIKit

class RoomsViewController: UIViewController {
    var roomViewModel: RoomViewModel?
    weak var coordinator: AppCoordinator?

    @IBOutlet weak var tableView: UITableView!
    var name: String = ""
    var loginViewController: LoginView?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        Task {
            await roomViewModel?.getRoomsAsync()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }
}
extension RoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return roomViewModel?.roomsRecordCount ?? 0

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

