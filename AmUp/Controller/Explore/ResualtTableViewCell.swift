//
//  ResualtTableViewCell.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/12/21.
//

import UIKit

class ResualtTableViewCell: UITableViewCell {

    @IBOutlet weak var imageresualt: UIImageView!
    @IBOutlet weak var profileLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
