//
//  homeViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/8/21.
//

import UIKit
import AlamofireImage
import Alamofire
import Just

class homeViewController: UIViewController {
    
    @IBOutlet weak var tableViewHome: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewHome.dataSource = self
        tableViewHome.delegate = self
        addBtnNavBarRighte()
        lblNavBar("Am up")
        fetchData()
    }
    
    //MARK:- Directe button in nav bar
    func addBtnNavBarRighte() {
        let rightBarButton = UIBarButtonItem(image: UIImage(named: "directed"), style: .plain, target: self, action: #selector(actionHandler))
        rightBarButton.tintColor = UIColor(named: "lableCustom")
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    @objc func actionHandler(sender: UIButton) {
        let vc = UIStoryboard.init(name: "singelViewSt", bundle: Bundle.main).instantiateViewController(withIdentifier: "directeViewController") as? directeViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    func fetchData() {
        
        let justDefault = JustSessionDefaults(
            headers: ["AUTH-TOKEN": UserDefaultsHelper.getData(type: String.self, forKey: .authToken)!]
        )
        
        let just = JustOf<HTTP>(defaults: justDefault)
        
            
        just.post(
            "http://94.130.88.31:8380/api/home",
            json: ["latitude" : "52.23232","longitude" : "35.232"], asyncCompletionHandler:  { r in
                print(r.statusCode!)
                if r.ok {
                    let json = r.json as? [String: Any]
                    print(json)
                }else {
                    print(r.error)
                }
            })
    }
    
    
    /**End** class   */
}
//MARK:- UITableview DataSource
extension homeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableViewHome.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! homeTableViewCell
        
        
        let imageurl = "https://maps.googleapis.com/maps/api/staticmap?center=&maptype=roadmap&path=color:0x000000%7Cweight:10%7Cenc:q%60kzDsacsMyEoIaDiGs@sAYa@OIc@W]VqBnBSRS]qE_IgLeT_BwCwFrEjBpDjA%7CBqAhA%7BCjCj@bA&markers=color:green%7Clabel:P%7C30.699000010896544,56.69869985431433&markers=color:red%7Clabel:D%7C50.707998,64.703069&key=AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA&size=700x700"
        let url = URL(string: imageurl)!
        let placeholderImage = UIImage(named: "placholdermapW")!
        cell.imageStaticMap.af.setImage(withURL: url, placeholderImage: placeholderImage)
        cell.profileImage.image = UIImage(named: "woman")
        cell.profileName.text = "hosin"
        cell.profileLocation.text = "NewYourk"
        cell.captionLbl.text = "jdhfjdhfjhdjdghdjgsdglkglkkljgksflgjsfklgjsfkjgsfkgjsfklgjsflkgjlksfgjlkfsjglksfjgio;afhjgoiuqryegiurjhgjksfahgo'wruqwirtu[prot iruwtyu3598760468249uiwqjgowrhgiuorqwhgkrngaushgjgkhfgkjlghih \n nwrhgjijwrhgkhqwrugioqrlkgjrgw;ohi \n qiwurgowrjgwrugh \n iuywghjwrguihwrghrjklgioh"
        return cell
    }
}
//MARK:- UITableViewDelegate Protocol
extension homeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "singelViewSt", bundle: Bundle.main).instantiateViewController(withIdentifier: "SingelPostViewController") as? SingelPostViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
