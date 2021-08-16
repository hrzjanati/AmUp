//
//  SingelPostViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/16/21.
//

import UIKit
import Alamofire
import AlamofireImage
import IHKeyboardAvoiding

class SingelPostViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var sendButtonOutlet: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewCreateComment: UIView!
    @IBOutlet weak var imageCreate: UIImageView!
    
    @IBOutlet weak var textViewCreate: UITextView!
    @IBOutlet weak var sendButtonCreate: UIButton!
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        imageSetInHeader()
        KeyboardAvoiding.avoidingView = self.viewCreateComment
        hideKeyboardWhenTappedAround()
        textViewCreate.autocorrectionType = .no
//    If need show key bouard
//        NotificationCenter.default.addObserver(self, selector: #selector(UIKeyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(UIKeyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        sendButtonOutlet.tintColor =  UIColor(named: "lableCustom")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
  
    
//    @objc func UIKeyboardWillShow(_ notification:Notification) {
//
//
//    }
    @objc func UIKeyboardWillHide(_ notification:Notification) {
        if (textViewCreate.text != "") {
            tableView.scrollToBottomRow()

        }
    }
    
    
    func fetchDataFromServer() {
        //TODO: init code Alamofire
        print("fetch data")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func sendData() {
        //TODO: send data to fire base
        print("send data")
    }
    
    func imageSetInHeader() {
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        let imageurl = "https://maps.googleapis.com/maps/api/staticmap?center=&maptype=roadmap&path=color:0x000000%7Cweight:10%7Cenc:q%60kzDsacsMyEoIaDiGs@sAYa@OIc@W]VqBnBSRS]qE_IgLeT_BwCwFrEjBpDjA%7CBqAhA%7BCjCj@bA&markers=color:green%7Clabel:P%7C30.699000010896544,56.69869985431433&key=AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA&size=700x700"
        let url = URL(string: imageurl)!
        let placeholderImage = UIImage(named: "placholdermapW")!
        
        tableView.contentInset = UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        imageView.frame = CGRect(x: 0, y: topBarHeight, width: UIScreen.main.bounds.size.width, height: 300)
        
        imageView.contentMode = .scaleAspectFill
        imageView.af.setImage(withURL: url, placeholderImage: placeholderImage)
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 0), 400)
        imageView.frame = CGRect(x: 0, y: topBarHeight, width: UIScreen.main.bounds.size.width, height: height)
    }
    

    
    @IBAction func sendButtonTapped(_ sender: Any) {
        view.endEditing(true)
        textViewCreate.text = ""
        sendData()
        fetchDataFromServer()
    }
    
    
}
//MARK:- Table View Data source
extension SingelPostViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingelPostCell", for: indexPath) as! SingelPostTableViewCell
            // init code
            cell.lblprofile.text = "ایلتابسلخهسنتسهخبلنسبتلخهسبعلمنسبتلخهسبعلنمتسبخهلاسبمنلسبهخلمنسبلدخهسبذمنیبدذهخیبالمنسبلخهاسمنلدسخهلامسنلدهسبخالخبستلنماتسبخهلامسنبلهسبالمسبدلخسبالنسبسبخهالنسلبخهانتات \n تسستبیمتلم\n \n \n lkjglksjgkjwkgjنتسایلنمتسمنسلنمت😨🥳نیت"
            cell.imageViewProfile.image = UIImage(named: "men")
            
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingelPostCell", for: indexPath) as! SingelPostTableViewCell
            cell.imageViewProfile.image = UIImage(named: "woman")
            cell.lblprofile.text = " NADIA:  hisjrljslkfjskljj \n ktehjhge \n jghgdbvhadgfaejfhadkjfhdjhfsdjvhsdhdsjghdsiughjkfhsruighsfkjghsfuighsfjghsfiughsjhjh"
            return cell
        }
        
        
        return UITableViewCell()
    }
}

//MARK:-Table View Delegate
extension SingelPostViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row")
    }
}

