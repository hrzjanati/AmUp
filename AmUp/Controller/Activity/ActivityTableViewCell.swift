//
//  ActivityTableViewCell.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/15/21.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    @IBOutlet weak var imageTable: UIImageView!
    
    @IBOutlet weak var satusLbl: UILabel!
    @IBOutlet weak var profileLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
