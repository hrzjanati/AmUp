//
//  DirecteTableViewCell.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/19/21.
//

import UIKit

class DirecteTableViewCell: UITableViewCell {

    @IBOutlet weak var lastSennDirect: UILabel!
    @IBOutlet weak var profileLblDirect: UILabel!
    @IBOutlet weak var imageDirect: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
