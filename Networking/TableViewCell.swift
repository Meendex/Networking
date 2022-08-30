//
//  TableViewCell.swift
//  Networking
//
//  Created by Mindaugas Balakauskas on 26/08/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var OccupiedLabel: UILabel!
    @IBOutlet weak var maxOccupancyLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
