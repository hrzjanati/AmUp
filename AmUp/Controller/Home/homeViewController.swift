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
    
    var dataArray = [Home]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        addBtnNavBarRighte()
        lblNavBar("Am up")
        //fetchData()
        postReq(compeleted: self.tableViewHome.reloadData)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableViewHome.dataSource = self
        tableViewHome.delegate = self
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
    
   
    
    func postReq(compeleted : @escaping () -> ()) {
        
        let Url = String(format: "http://94.130.88.31:8380/api/home")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["latitude" : 1.3,"longitude" : 2.3]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue(UserDefaultsHelper.getData(type: String.self, forKey: .authToken)!, forHTTPHeaderField:  "AUTH-TOKEN" )
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
                
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("STAUS : => \(httpResponse.statusCode)")
            }
            if let data = data {
                do {
                    self.dataArray = try JSONDecoder().decode([Home].self, from: data)
                    print(self.dataArray)
                    DispatchQueue.main.async {
                        compeleted()
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    
    /**End** class   */
}
//MARK:- UITableview DataSource
extension homeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewHome.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! homeTableViewCell
        
        
        let lat = dataArray[indexPath.row].latitude
        let long = dataArray[indexPath.row].longitude
        
        let user = dataArray[indexPath.row].user
        let profileDetails = user?.profileDetails
        let userName = user?.username
        let fullName = user?.fullName
        let avatarUrl = (profileDetails?.avatarURL) ?? "https://maps.googleapis.com/maps/api/staticmap?center=&maptype=roadmap&path=color:0x000000%7Cweight:10%7Cenc:q%60kzDsacsMyEoIaDiGs@sAYa@OIc@W]VqBnBSRS]qE_IgLeT_BwCwFrEjBpDjA%7CBqAhA%7BCjCj@bA&markers=color:red%7Clabel:P%7C\(lat),\(long)&key=AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA&size=700x700"
        
        let imageurl = "https://maps.googleapis.com/maps/api/staticmap?center=&maptype=roadmap&path=color:0x000000%7Cweight:10%7Cenc:q%60kzDsacsMyEoIaDiGs@sAYa@OIc@W]VqBnBSRS]qE_IgLeT_BwCwFrEjBpDjA%7CBqAhA%7BCjCj@bA&markers=color:red%7Clabel:P%7C\(lat),\(long)&key=AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA&size=700x700"
        let url = URL(string: imageurl)!
        let avatarUrlAlamo = URL(string: avatarUrl)!
        let placeholderImage = UIImage(named: "placholdermapW")!
        
        cell.imageStaticMap.af.setImage(withURL: url, placeholderImage: placeholderImage)
        cell.profileImage.af.setImage(withURL: avatarUrlAlamo , placeholderImage: placeholderImage)
        cell.profileName.text = userName
        cell.profileLocation.text = fullName
        cell.captionLbl.text = dataArray[indexPath.row].caption
        return cell
    }
}
//MARK:- UITableViewDelegate Protocol
extension homeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let isCommentEnabled = dataArray[indexPath.row].isCommentEnabled
        if isCommentEnabled == true {
            let vc = UIStoryboard.init(name: "singelViewSt", bundle: Bundle.main).instantiateViewController(withIdentifier: "SingelPostViewController") as? SingelPostViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        
        }
        
 }
    
}
