//
//  signInViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/8/21.
//

import UIKit
import Alamofire

class signInViewController: UIViewController, ActivityIndicatorPresenter {
    
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
      //  showActivityIndicator()
    }
    
    
    func reqestPostURLSession() {
        let Url = String(format: "http://94.130.88.31:8380/api/register")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["username" : "Test3552f2", "password" : "12767634562", "full_name" : "rezazadreh27665"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }

    
    
    @IBAction func tappedLogin(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "TabbarSt", bundle:nil)
        
        let mainTabBAr = storyBoard.instantiateViewController(withIdentifier: "tabBarIdenti")
        mainTabBAr.modalPresentationStyle = .fullScreen
        self.present(mainTabBAr, animated:false, completion:nil)
    }
    
}



struct requestRegister {
    var username : String
    var password : String
    var full_name : String
}




//
//NetworkCall(data: parameters, url: "http://94.130.88.31:8380/api/register", service: .posts, method: .post).executeQuery(){
//    (result: Result<Post,Error>) in
//    switch result{
//    case .success(let post):
//      print(post)
//    case .failure(let error):
//        print(error)
//    }
//    self.hideActivityIndicator()
//}



