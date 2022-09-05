//
//  TableViewCell.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 26/08/2022.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var OccupiedLabel: UILabel!
    @IBOutlet weak var maxOccupancyLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateData(with roomData: Rooms) {
        createAtLabel.text = roomData.createdAt
        maxOccupancyLabel.text = String(roomData.maxOccupancy)
        OccupiedLabel.text = String(roomData.isOccupied)
        idLabel.text = roomData.id
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
