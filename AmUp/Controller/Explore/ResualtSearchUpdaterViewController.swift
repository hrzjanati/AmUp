//
//  ResualtSearchUpdaterViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/12/21.
//

import UIKit


class ResualtSearchUpdaterViewController: UIViewController, CustomSegmentedControlDelegate{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var interfaceSegmented: CustomSegmentedControl!{
        didSet{
            interfaceSegmented.setButtonTitles(buttonTitles: ["All","Events","Tags","Places"])
            interfaceSegmented.selectorViewColor = UIColor(named: "lableCustom")!
            interfaceSegmented.selectorTextColor = UIColor(named: "lableCustom")!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceSegmented.delegate = self
        interfaceSegmented.backgroundColor = .systemBackground
        tableView.dataSource = self
        self.tableView.rowHeight = 70.0
        
        let label = UILabel(frame: CGRect(x: 0, y: 42, width: view.frame.size.width, height: 1))
        label.backgroundColor = UIColor(named: "lableSegment")
        self.view.addSubview(label)
        
    }
    
    func change(to index: Int) {
        print("segmentedControl index changed to \(index)")
        
        if (index == 0) {
            People()
        }else if (index == 1) {
            tags()
        }else if (index == 2) {
            events()
        }else if (index == 3) {
            place()
        }
    }
    
    func People() {
        
    }
    
    func tags() {
        
    }
    
    func events() {
        
    }
    
    func place() {
        
    }
}

extension ResualtSearchUpdaterViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResualtTableViewCell", for: indexPath) as! ResualtTableViewCell
        cell.imageresualt.image = UIImage(named: "woman")
        cell.profileLbl.text = "nahid"
        cell.statusLbl.text = "jfdsh"
        
        return cell
    }
    
    
    func textDidSerch(string: String) {
        print("in calss resualt \(string)")
        if (string != "") {
            qury(string)
        }
        
        
    }
    
    private func qury(_ text : String) {
        //perform the search in the backend
        print("send data to server \(text)")
    }
    
}
