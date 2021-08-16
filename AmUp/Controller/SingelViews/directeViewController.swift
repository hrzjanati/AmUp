//
//  directeViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/8/21.
//

import UIKit

class directeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = 70.0

    }

}
//MARK:- UITableViewDataSource Protocol
extension directeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirecteTableCell", for: indexPath) as! DirecteTableViewCell
        cell.imageDirect.image = UIImage(named: "woman")
        cell.profileLblDirect.text = "hosein"
        cell.lastSennDirect.text = "Seen 1h ago"
        return cell
    }
    
    
}


extension directeViewController : UITableViewDelegate {
    
}
