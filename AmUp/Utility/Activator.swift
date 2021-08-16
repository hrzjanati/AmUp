//
//  Activator.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 6/5/21.
//

import Foundation
import UIKit

/// Used for ViewControllers that need to present an activity indicator when loading data.
public protocol ActivityIndicatorPresenter {
    
    /// The activity indicator
    var activityIndicator: UIActivityIndicatorView { get }
    
    /// Show the activity indicator in the view
    func showActivityIndicator()
    
    /// Hide the activity indicator in the view
    func hideActivityIndicator()
}
public extension ActivityIndicatorPresenter where Self: UIViewController {
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating();
            alert.view.addSubview(loadingIndicator)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
