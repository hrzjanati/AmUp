//
//  detailsNewPostViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/13/21.
//

import UIKit
import Just


class detailsNewPostViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = ["When?","Delete afther?","Comment","Public"]
    var textView = UITextView()
    var caption : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        textView.delegate = self
        textView.text = "Caption:"
        textView.textColor = UIColor(named: "lableCustom")
        let button1 = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(self.action))
        self.navigationItem.rightBarButtonItem  = button1
        
        self.tableView.tableFooterView = UIView()
    }
    
    @objc func action() {
        print("share button tapped")
        quary()
    }
    
    func quary() {
        let token = UserDefaultsHelper.getData(type: String.self, forKey: .authToken)!
        let justDefault = JustSessionDefaults(
            headers: ["AUTH-TOKEN": UserDefaultsHelper.getData(type: String.self, forKey: .authToken)!]
        )
        let just = JustOf<HTTP>(defaults: justDefault)
        
        
        just.post(
            "http://94.130.88.31:8380/api/create",
            json: ["type": "post",
                   "filters": ["latitude" : 52.23232,
                   "longitude" : 35.232,
                   "caption" : caption,
                   "is_comment_enabled" : true,
                   "event_date_time" : 1620398719,
                   "expiration_date_time" : 1632398719]], asyncCompletionHandler:  { r in
                print(r.statusCode!)
                if r.ok {
                    let json = r.json as? [String: Any]
                    print(json)
                }else {
                    print(r.error)
                }
            })
    }
    
    
    //MARK:- textView in tabel view header Begin Edit
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    // textView End Edit
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Caption:"
            textView.textColor = UIColor.lightGray
        }
        if (textView.text == "Caption:" ) {
            caption = ""
        }else {
            caption = textView.text
            print(caption as String)
        }
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
//MARK:- UITable View Data Source
extension detailsNewPostViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsNewPostTableViewCell", for: indexPath) as! DetailsNewPostTableViewCell
        
        cell.titelLbl.text = array[indexPath.row]
        
        //here is programatically switch make to the table view
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row // for detect which row switch Changed
        switchView.onTintColor = .link
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        
        if (indexPath.row == 2 || indexPath.row == 3) {
            cell.accessoryView = switchView
        }else {
            let picker : UIDatePicker = UIDatePicker()
            picker.datePickerMode = UIDatePicker.Mode.date
            picker.addTarget(self, action: #selector(dueDateChanged(sender:)), for: UIControl.Event.valueChanged)
            picker.tag = indexPath.row
            let pickerSize : CGSize = picker.sizeThatFits(CGSize.zero)
            picker.frame = CGRect(x:0.0, y:0.0, width:pickerSize.width, height:460)
            cell.accessoryView = picker
        }
        return cell
    }
    
    
    // switch satus in table view
    @objc func switchChanged(_ sender : UISwitch!){
        print("table row switch Changed \(sender.tag)")
        print("The switch is \(sender.isOn ? "ON" : "OFF")")
    }
    
    // date picker view
    @objc func dueDateChanged(sender:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: sender.date)
        print(sender.tag)
        print(somedateString)
    }
    
}

//MARK:- TabelViewDelegate
extension detailsNewPostViewController: UITableViewDelegate {
    //Header size 
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    // add text view in Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 100))
        textView.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width - 90, height: headerView.frame.height)
        textView.font = UIFont(name: "FONTSPRINGDEMO-BlueVinylRegular", size: 18)
        
        
        
        let imageurl = "https://maps.googleapis.com/maps/api/staticmap?center=&maptype=roadmap&path=color:0x000000%7Cweight:10%7Cenc:q%60kzDsacsMyEoIaDiGs@sAYa@OIc@W]VqBnBSRS]qE_IgLeT_BwCwFrEjBpDjA%7CBqAhA%7BCjCj@bA&markers=color:green%7Clabel:P%7C30.699000010896544,56.69869985431433&markers=color:red%7Clabel:D%7C50.707998,64.703069&key=AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA&size=700x700"
        let url = URL(string: imageurl)!
        let placeholderImage = UIImage(named: "placholdermapW")!
        
        let imageHeader = UIImageView(frame: CGRect(x: headerView.frame.width - 90, y: 5, width: 90, height: 90))
        imageHeader.af.setImage(withURL: url, placeholderImage: placeholderImage)
        
        
        
        headerView.addSubview(imageHeader)
        headerView.addSubview(textView)
        return headerView
    }
    
    // did selected table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0 || indexPath.row == 1) {
        }
    }
    
    
}

