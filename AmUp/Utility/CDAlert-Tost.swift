//
//  CDAlertExtension.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 6/5/21.
//

import Foundation
import CDAlertView
import SwiftToast

//Extension All Alert view from library
extension CDAlertViewType : CaseIterable
{
    public static var allCases: [CDAlertViewType] {
        return [.error, .warning, .success, .notification, .alarm, .noImage, .custom(image: UIImage())]
    }
  
    var description: String {
        switch self {
        case .error:
            return "Error"
        case .success:
            return "Success"
        case .warning:
            return "Warning"
        case .notification:
            return "Notification"
        case .alarm:
            return "Alarm"
        case .custom:
            return "Custom"
        case .noImage:
            return "No image"
        }
    }
}

extension UIViewController {
//simpel show toast
func showToastSimpel(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}
    //custom toast with library
    func showToastDanger(text:String) {
        let test =  SwiftToast(
                            text: text,
                            textAlignment: .center,
                            image: UIImage(named: "dangerIcone"),
                            backgroundColor: UIColor(red: 255/255, green: 62/255, blue: 81/255, alpha: 1),
                            textColor: .white,
                            font: UIFont(name: "IRANSansMobileFaNum", size: 14),
                            duration: 3.0,
                            minimumHeight: CGFloat(110.0),
                            statusBarStyle: .lightContent,
                            aboveStatusBar: true,
                            target: nil,
                            style: .navigationBar)
        present(test, animated: true)
    }
    
    func showToastSucses(text:String) {
        let test =  SwiftToast(
                            text: text,
                            textAlignment: .center,
                            image: UIImage(named: "dangerIcone"),
            backgroundColor: UIColor.systemGreen,
                            textColor: .white,
                            font: UIFont(name: "IRANSansMobileFaNum", size: 14),
                            duration: 3.0,
                            minimumHeight: CGFloat(110.0),
                            statusBarStyle: .lightContent,
                            aboveStatusBar: true,
                            target: nil,
                            style: .navigationBar)
        present(test, animated: true)
    }
    
    
    func showAlertWarning(numberOfAlert:Int, titleMessage:String, message:String, buttonTitel:String) {
        
        let alertViewType = CDAlertViewType.allCases[numberOfAlert]
        
        let alert = CDAlertView(title: titleMessage, message: message, type: alertViewType)
        let action = CDAlertViewAction(title: buttonTitel)
        alert.isTextFieldHidden = true
        alert.add(action: action)
    
        alert.hideAnimations = { (center, transform, alpha) in
            transform = .identity
            alpha = 0
        }

        alert.show() { (alert) in
            print("completed")
        }
    }
}
