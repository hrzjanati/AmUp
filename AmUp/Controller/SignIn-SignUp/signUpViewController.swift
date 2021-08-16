//
//  signUpViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/8/21.
//

import UIKit
import Alamofire
import Just

class signUpViewController: UIViewController, ActivityIndicatorPresenter  {
    
    var activityIndicator = UIActivityIndicatorView()
    
    @IBOutlet weak var nametxtFld: PaddableTextField!
    @IBOutlet weak var lastNameTxtFld: PaddableTextField!
    @IBOutlet weak var passwordTxtFld: PaddableTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        if (nametxtFld.text == nil || nametxtFld.text == "") {
            showToastDanger(text: "please enter the name")
        }else if (lastNameTxtFld.text == nil || lastNameTxtFld.text == "") {
            showToastDanger(text: "please enter the last name")
        }else if (passwordTxtFld.text == nil || passwordTxtFld.text == "") {
            showToastDanger(text: "please enter the password")
        }else {
            showActivityIndicator()
            Just.post(
                "http://94.130.88.31:8380/api/register",
                json: ["username" : nametxtFld.text!,"password" : passwordTxtFld.text!,  "full_name" : lastNameTxtFld.text!], asyncCompletionHandler:  { r in
                    print(r.statusCode!)
                    if r.ok {
                        let json = r.json as? [String: Any]
                        let autToken = json!["AUTH-TOKEN"]
                        print(autToken!)
                        UserDefaultsHelper.setData(value: autToken, key: .authToken)
                    }else {
                        print(r.error!)
                    }
                })

            self.hideActivityIndicator()
            nametxtFld.resignFirstResponder()
            passwordTxtFld.resignFirstResponder()
            lastNameTxtFld.resignFirstResponder()
        }
        
        
    }
    
    
    @IBAction func backButtomTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


struct register : Decodable {
    let AUTHTOKEN: String
}
